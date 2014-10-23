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

#ifndef __CCBILLBOARDLABLE_H__
#define __CCBILLBOARDLABLE_H__

#include "2d/CCLabel.h"
#include "3d/CCBillBoard.h"

USING_NS_CC;

NS_CC_BEGIN
    /**
    * Inherit from Sprite, achieve BillBoard.
    */
class CC_DLL BillBoardLable : public Label
{
public:
     enum class Mode
    {
        VIEW_POINT_ORIENTED, // orient to the camera
        VIEW_PLANE_ORIENTED // orient to the XOY plane of camera
    };
      /** Creates a label with an initial string,font file,font size, dimension in points, horizontal alignment and vertical alignment.
    * @warning Not support font name.
    * @warning Cache textures for each different font size or font file.
    */
    static Label * createWithTTF(const std::string& text, const std::string& fontFile, float fontSize,
        const Size& dimensions = Size::ZERO, TextHAlignment hAlignment = TextHAlignment::LEFT,
        TextVAlignment vAlignment = TextVAlignment::TOP);

    /** Create a label with TTF configuration
    * @warning Not support font name.
    * @warning Cache textures for each different font file when enable distance field.
    * @warning Cache textures for each different font size or font file when disable distance field.
    */
    static Label* createWithTTF(const TTFConfig& ttfConfig, const std::string& text, TextHAlignment alignment = TextHAlignment::LEFT, int maxLineWidth = 0);
     /** Set the billboard rotation mode. */
    void setMode(Mode mode);

    /** Get the billboard rotation mode. */
    BillBoardLable::Mode getMode() const;
CC_CONSTRUCTOR_ACCESS:
    BillBoardLable(FontAtlas *atlas = nullptr, TextHAlignment hAlignment = TextHAlignment::LEFT,
        TextVAlignment vAlignment = TextVAlignment::TOP,bool useDistanceField = false,bool useA8Shader = false);
    virtual ~BillBoardLable();

    virtual void draw(Renderer *renderer, const Mat4 &transform, uint32_t flags) override;
private:
    CC_DISALLOW_COPY_AND_ASSIGN(BillBoardLable);
    Mat4 _camWorldMat;
    Mat4 _mvTransform;
    Mat4 _billboardTransform;
    bool _modeDirty;
    Mode _mode;
};

NS_CC_END


#endif // __CCBILLBOARD_H__
