/****************************************************************************
 Copyright (c) 2014 Chukong Technologies Inc.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "ShareFacebook.h"
#import "ShareWrapper.h"
#import <FacebookSDK/FacebookSDK.h>
#import "ParseUtils.h"
#define OUTPUT_LOG(...)     if (self.debug) NSLog(__VA_ARGS__);

@implementation ShareFacebook

@synthesize mShareInfo;
@synthesize debug = __debug;

/**
 * A function for parsing URL parameters.
 */
- (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *key = [kv[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[key] = val;
    }
    return params;
}

/**
 * shareInfo parameters support both AnySDK style and facebook style
 *  1. AnySDK style
 *      - title
 *      - site
 *      - siteUrl
 *      - text
 *      - imageUrl
 *      - imagePath
 *
 *  2. Facebook style
 *      - caption
 *      - name
 *      - link
 *      - description
 *      - picture
 */
- (void)convertParamsToFBParams:(NSMutableDictionary*) shareInfo {
    // Link type share info
    NSString *link = [shareInfo objectForKey:@"siteUrl"];
    if (!link) {
        link = [shareInfo objectForKey:@"link"];
    }
    else {
        [shareInfo setObject:link forKey:@"link"];
    }
    // Photo type share info
    NSString *photo = [shareInfo objectForKey:@"imageUrl"];
    if (!photo) {
        photo = [shareInfo objectForKey:@"imagePath"];
    }
    if (!photo) {
        photo = [shareInfo objectForKey:@"photo"];
    }
    else {
        [shareInfo setObject:photo forKey:@"photo"];
        [shareInfo setObject:photo forKey:@"picture"];
    }
    
    // Title
    NSString *caption = [shareInfo objectForKey:@"title"];
    if (!caption) {
        link = [shareInfo objectForKey:@"caption"];
    }
    else {
        [shareInfo setObject:caption forKey:@"caption"];
    }
    
    // Site name
    NSString *name = [shareInfo objectForKey:@"site"];
    if (!name) {
        link = [shareInfo objectForKey:@"name"];
    }
    else {
        [shareInfo setObject:name forKey:@"name"];
    }
    
    // Description
    NSString *desc = [shareInfo objectForKey:@"text"];
    if (!desc) {
        link = [shareInfo objectForKey:@"description"];
    }
    else {
        [shareInfo setObject:desc forKey:@"description"];
    }
}

- (void) configDeveloperInfo : (NSMutableDictionary*) cpInfo
{
}

- (void) share: (NSMutableDictionary*) shareInfo
{
    [self convertParamsToFBParams:shareInfo];
    NSString *link = [shareInfo objectForKey:@"link"];
    NSString *photo = [shareInfo objectForKey:@"photo"];
    
    if (link) {
        // Link type share info
        NSString *link = [shareInfo objectForKey:@"link"];
        NSString *caption = [shareInfo objectForKey:@"caption"];
        NSString *name = [shareInfo objectForKey:@"name"];
        NSString *desc = [shareInfo objectForKey:@"description"];
        NSString *photo = [shareInfo objectForKey:@"picture"];
        
        FBLinkShareParams *params = [[FBLinkShareParams alloc] initWithLink:[NSURL URLWithString:link]
                                                                       name:name
                                                                    caption:caption
                                                                description:desc
                                                                    picture:[NSURL URLWithString:photo]];
        
        // If the Facebook app is installed and we can present the share dialog
        if ([FBDialogs canPresentShareDialogWithParams:params]) {
            [self shareLinkDialogFB:params];
        } else {
            // Fallback to web feed dialog
            [self feedDialogWeb:shareInfo];
        }
    }
    else if (photo) {
        NSURL *photoUrl = [NSURL URLWithString:[shareInfo objectForKey:@"photo"]];
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:photoUrl]];
        FBPhotoParams *params = [[FBPhotoParams alloc] init];
        params.photos = @[img];
        
        // If the Facebook app is installed and we can present the share dialog
        if ([FBDialogs canPresentShareDialogWithPhotos]) {
            [self sharePhotoDialogFB:params];
        } else {
            NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the photo sharing dialog" andKey:@"error_message"];
            [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
        }
    }
    else {
         NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, share target absent or not supported, please add 'siteUrl' or 'imageUrl' in parameters" andKey:@"error_message"];
        [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
    }
}

- (void) setDebugMode: (BOOL) debug
{
    self.debug = debug;
}

- (NSString*) getSDKVersion
{
    return [FBSettings sdkVersion];
}

- (NSString*) getPluginVersion
{
    return @"0.2.0";
}

- (void) dialog: (NSMutableDictionary*) shareInfo
{
    [self convertParamsToFBParams:shareInfo];
    NSString *dialog_type = [shareInfo objectForKey:@"dialog"];
    
    bool not_supported = false;
    
    if ([dialog_type hasSuffix:@"link"]) {
        // Link type share info
        NSString *link = [shareInfo objectForKey:@"link"];
        NSString *caption = [shareInfo objectForKey:@"caption"];
        NSString *name = [shareInfo objectForKey:@"name"];
        NSString *desc = [shareInfo objectForKey:@"description"];
        NSString *photo = [shareInfo objectForKey:@"picture"];
        
        FBLinkShareParams *params = [[FBLinkShareParams alloc] initWithLink:[NSURL URLWithString:link]
                                                                       name:name
                                                                    caption:caption
                                                                description:desc
                                                                    picture:[NSURL URLWithString:photo]];
        
        
        if ([dialog_type isEqualToString:@"share_link"]) {
            // If the Facebook app is installed and we can present the share dialog
            if ([FBDialogs canPresentShareDialogWithParams:params]) {
                [self shareLinkDialogFB:params];
            } else {
                [self feedDialogWeb:shareInfo];
                // Fallback to web feed dialog
            }
        }
        else if ([dialog_type isEqualToString:@"message_link"]) {
            if ([FBDialogs canPresentMessageDialogWithParams:params]) {
                [self messageLinkDialogFB:params];
            }
            else {
                NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the link message dialog, Facebook Messenger is needed on target device" andKey:@"error_message"];
                [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            }
        }
        else {
            not_supported = true;
        }
    }
    else if ([dialog_type hasSuffix:@"open_graph"]) {
        NSString *type = [shareInfo objectForKey:@"action_type"];
        NSString *previewProperty = [shareInfo objectForKey:@"preview_property"];
        NSString *title = [shareInfo objectForKey:@"title"];
        NSString *image = [shareInfo objectForKey:@"image"];
        NSString *link = [shareInfo objectForKey:@"link"];
        NSString *desc = [shareInfo objectForKey:@"description"];
        
        id<FBGraphObject> object = [FBGraphObject openGraphObjectForPostWithType: type
                                                                           title: title
                                                                           image: image
                                                                             url: [NSURL URLWithString:link]
                                                                     description: desc];
        id<FBOpenGraphAction> action = (id<FBOpenGraphAction>)[FBGraphObject graphObject];
        [action setObject:object forKey:previewProperty];
        FBOpenGraphActionParams *params = [[FBOpenGraphActionParams alloc] initWithAction:action
                                                                               actionType:type
                                                                      previewPropertyName:previewProperty];
        
        if ([dialog_type isEqualToString:@"share_open_graph"]) {
            if ([FBDialogs canPresentShareDialogWithOpenGraphActionParams:params]) {
                [self shareOpenGraphDialogFB:params];
            } else {
                NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the open graph sharing dialog, Facebook app is needed on target device" andKey:@"error_message"];
                [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            }
        }
        else if ([dialog_type isEqualToString:@"message_open_graph"]) {
            if ([FBDialogs canPresentMessageDialogWithOpenGraphActionParams:params]) {
                [self messageOpenGraphDialogFB:params];
            } else {
                NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the open graph message dialog, Facebook Messenger is needed on target device" andKey:@"error_message"];
                [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            }
        }
        else {
            not_supported = true;
        }
    }
    else if ([dialog_type hasSuffix:@"photo"]) {
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:[shareInfo objectForKey:@"photo"]];
        if(img ==nil){
            NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, photo can't be found" andKey:@"error_message"];
            [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            return;
        }
        FBPhotoParams *params = [[FBPhotoParams alloc] init];
        params.photos = @[img];
        
        if ([dialog_type isEqualToString:@"share_photo"]) {
            if ([FBDialogs canPresentShareDialogWithPhotos]) {
                [self sharePhotoDialogFB:params];
            } else {
                NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the photo sharing dialog, Facebook app is needed on target device" andKey:@"error_message"];
                [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            }
        }
        else if ([dialog_type isEqualToString:@"message_photo"]) {
            if ([FBDialogs canPresentMessageDialogWithPhotos]) {
                [self messagePhotoDialogFB:params];
            } else {
                NSString *msg = [ParseUtils MakeJsonStringWithObject:@"Share failed, facebook sdk cannot present the photo message dialog, Facebook Messenger is needed on target device" andKey:@"error_message"];
                [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
            }
        }
        else {
            not_supported = true;
        }
    }
    else {
        not_supported = true;
    }
    
    if (not_supported) {
        NSString *error = [NSString stringWithFormat:@"Share failed, dialog not supported: %@", dialog_type];
        NSString *msg = [ParseUtils MakeJsonStringWithObject:error andKey:@"error_message"];
        [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
    }
}

- (void) shareLinkDialogFB: (FBLinkShareParams*) params
{
    // Present the share dialog
    [FBDialogs presentShareDialogWithParams: params
                                clientState: nil
                                    handler: ^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                        if(error) {
                                            NSString *msg = [ParseUtils MakeJsonStringWithObject:error.description andKey:@"error_message"];
                                            [ShareWrapper onShareResult:self withRet:(int)error.code withMsg:msg];
                                        } else {
                                            if([self checkDialogResult:results]){
                                                NSString *msg = nil;
                                                if([results objectForKey:@"postId"]!=nil){
                                                    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:results];
                                                    [mdic removeObjectForKey:@"postId"];
                                                    [mdic setObject:[results objectForKey:@"postId"] forKey:@"post_id"];
                                                    msg = [ParseUtils NSDictionaryToNSString:mdic];
                                                }else{
                                                    msg = [ParseUtils NSDictionaryToNSString: results];
                                                }
                                                [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                                            }
                                        }
                                    }];
}

- (void) shareOpenGraphDialogFB: (FBOpenGraphActionParams*) params
{
    [FBDialogs
     presentShareDialogWithOpenGraphActionParams: params
     clientState: nil
     handler: ^(FBAppCall *call, NSDictionary *results, NSError *error) {
         if(error) {
             NSString *errorMsg = [NSString stringWithFormat:@"Share failed: %@", error.description];
             NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
             [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
         } else {
             if([self checkDialogResult:results]){
                 NSString *msg = nil;
                 if([results objectForKey:@"postId"]!=nil){
                     NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:results];
                     [mdic removeObjectForKey:@"postId"];
                     [mdic setObject:[results objectForKey:@"postId"] forKey:@"post_id"];
                     msg = [ParseUtils NSDictionaryToNSString:mdic];
                 }else{
                     msg = [ParseUtils NSDictionaryToNSString: results];
                 }
                 [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
             }
         }
     }];
}

- (void) sharePhotoDialogFB: (FBPhotoParams*) params
{
    // Present the share dialog
    [FBDialogs presentShareDialogWithPhotoParams:params
                                     clientState:nil
                                         handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                             if(error) {
                                                 NSString *msg = [ParseUtils MakeJsonStringWithObject:error.description andKey:@"error_message"];
                                                 [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
                                             } else {
                                                 if([self checkDialogResult:results]){
                                                     NSString *msg = nil;
                                                     if([results objectForKey:@"didComplete"]){
                                                         NSDictionary *dic = [NSDictionary  dictionaryWithObject:[results objectForKey:@"didComplete"] forKey:@"didComplete"];
                                                         msg = [ParseUtils NSDictionaryToNSString:dic];
                                                     }else{
                                                         msg = [ParseUtils NSDictionaryToNSString:results];
                                                     }
                                                     [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                                                 }
                                             }
                                         }];
}

- (void) messageLinkDialogFB: (FBLinkShareParams*) params
{
    // Present the share dialog
    [FBDialogs presentMessageDialogWithParams: params
                                  clientState: nil
                                      handler: ^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                          if(error) {
                                              NSString *errorMsg = [NSString stringWithFormat:@"Failed to send message: %@", error.description];
                                              NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
                                              [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
                                          } else {
                                              if([self checkDialogResult:results]){
                                                  NSString *msg = nil;
                                                  if([results objectForKey:@"didComplete"]){
                                                      NSDictionary *dic = [NSDictionary  dictionaryWithObject:[results objectForKey:@"didComplete"] forKey:@"didComplete"];
                                                      msg = [ParseUtils NSDictionaryToNSString:dic];
                                                  }else{
                                                      msg = [ParseUtils NSDictionaryToNSString:results];
                                                  }
                                                  [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                                              }
                                          }
                                      }];
}

- (void) messageOpenGraphDialogFB: (FBOpenGraphActionParams*) params
{
    [FBDialogs
     presentMessageDialogWithOpenGraphActionParams:params
     clientState:nil
     handler: ^(FBAppCall *call, NSDictionary *results, NSError *error) {
         if(error) {
             NSString *errorMsg = [NSString stringWithFormat:@"Failed to send message: %@", error.description];
             NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
             [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
         } else {
             if([self checkDialogResult:results]){
                 NSString *msg = nil;
                 if([results objectForKey:@"didComplete"]){
                     NSDictionary *dic = [NSDictionary  dictionaryWithObject:[results objectForKey:@"didComplete"] forKey:@"didComplete"];
                     msg = [ParseUtils NSDictionaryToNSString:dic];
                 }else{
                     msg = [ParseUtils NSDictionaryToNSString:results];
                 }
                 [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
             }
         }
     }];
}

- (void) messagePhotoDialogFB: (FBPhotoParams*) params
{
    // Present the share dialog
    [FBDialogs presentMessageDialogWithPhotoParams:params
                                       clientState:nil
                                           handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                               if(error) {
                                                   NSString *errorMsg = [NSString stringWithFormat:@"Failed to send message: %@", error.description];
                                                   NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
                                                   [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
                                               } else {
                                                   if([self checkDialogResult:results]){
                                                       NSString *msg = nil;
                                                       if([results objectForKey:@"didComplete"]){
                                                           NSDictionary *dic = [NSDictionary  dictionaryWithObject:[results objectForKey:@"didComplete"] forKey:@"didComplete"];
                                                           msg = [ParseUtils NSDictionaryToNSString:dic];
                                                       }else{
                                                           msg = [ParseUtils NSDictionaryToNSString:results];
                                                       }
                                                       [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                                                   }
                                               }
                                           }];
}
-(BOOL) checkDialogResult:(NSDictionary *)results{
    if([results valueForKey:@"completionGesture"]!=nil &&![[results valueForKey:@"completionGesture"] isEqualToString:@"cancel"]){
        return true;
    }else{
        NSString  *msg = [ParseUtils MakeJsonStringWithObject:@"User canceled request" andKey:@"error_message"];
        [ShareWrapper onShareResult:self withRet:kShareCancel withMsg:msg];
        return false;
    }
}
- (void) feedDialogWeb: (NSDictionary*) params
{
    [FBWebDialogs
     presentFeedDialogModallyWithSession:[FBSession activeSession]
     parameters:params
     handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
         if (error) {
             // Error launching the dialog or publishing a story.
             NSString *errorMsg = [NSString stringWithFormat:@"Share failed: %@", error.description];
             NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
             [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
         } else {
             if (result == FBWebDialogResultDialogNotCompleted) {
                 // User clicked the "x" icon
                 [ShareWrapper onShareResult:self withRet:kShareFail withMsg:@"User canceled sharing"];
             } else {
                 // Handle the publish feed callback
                 NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                 if (![urlParams valueForKey:@"post_id"]) {
                     // User clicked the Cancel button
                     [ShareWrapper onShareResult:self withRet:kShareFail withMsg:@"User canceled sharing"];
                 } else {
                     // User clicked the Share button
                     NSString *msg = [ParseUtils MakeJsonStringWithObject:[urlParams valueForKey:@"post_id"] andKey:@"post_id"];
                     [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                 }
             }
         }
     }];
}

- (void) appRequest: (NSMutableDictionary*) shareInfo
{
    NSString *message = [shareInfo objectForKey:@"message"];
    NSString *title = [shareInfo objectForKey:@"title"];
    
    // Display the requests dialog
    [FBWebDialogs
     presentRequestsDialogModallyWithSession:[FBSession activeSession]
     message: message
     title: title
     parameters: nil
     handler: ^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
         if (error) {
             // Error launching the dialog or sending the request.
             NSString *errorMsg = [NSString stringWithFormat:@"Sending request failed: %@", error.description];
             NSString *msg = [ParseUtils MakeJsonStringWithObject:errorMsg andKey:@"error_message"];
             [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
         } else {
             if (result == FBWebDialogResultDialogNotCompleted) {
                 // User clicked the "x" icon
                 NSString *msg = [ParseUtils MakeJsonStringWithObject:@"User canceled request" andKey:@"error_message"];
                 [ShareWrapper onShareResult:self withRet:kShareFail withMsg:msg];
             } else {
                 // Handle the send request callback
                 NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                 NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                 if([urlParams count]>0){
                     int i = 0;
                     NSMutableArray *resultArray = [[NSMutableArray alloc] init];
                     while ([urlParams objectForKey:[NSString stringWithFormat:@"to[%d]",i]]!=nil) {
                         resultArray[i] = [urlParams objectForKey:[NSString stringWithFormat:@"to[%d]",i]];
                         ++i;
                     }
                     if([urlParams valueForKey:@"request"]){
                         [dic setObject:[urlParams objectForKey:@"request"] forKey:@"request"];
                     }
                     if([resultArray count]>0){
                         [dic setObject:resultArray forKey:@"to"];
                     }
                 }
                 if (![urlParams valueForKey:@"request"]) {
                     // User clicked the Cancel button
                     NSString *msg = [ParseUtils MakeJsonStringWithObject:@"User canceled request" andKey:@"error_message"];
                     [ShareWrapper onShareResult:self withRet:(int)error.code withMsg:msg];
                 } else {
                     // User clicked the Send button
                     NSString *msg = [ParseUtils NSDictionaryToNSString:dic];
                     [ShareWrapper onShareResult:self withRet:kShareSuccess withMsg:msg];
                 }
             }
         }
     }];
}

@end