fbxconverter version 0.3
It is for cocos2d-x after version v3.3

Convert .fbx to .c3t used by cocos2d-x. Thanks to libgdx fbx-conv. We use their code and do some change.

Source code is here,
https://github.com/lvlonggame/cocos2d-x-3rd-party-libs-src 

USAGE:

Command line
MAC:
cd -a|-b|t [path of fbx-conv]
./fbx-conv FBXFile

Windows:
cd [path of fbx-conv]
fbx-conv -a|-b|t FBXFile

-a export both c3t and c3b
-b export c3b
-t export c3t


Note: 
This version of fbx-conv supports multiple meshes and multiple materials.
