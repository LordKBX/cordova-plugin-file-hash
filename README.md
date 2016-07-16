---
title: cordova-plugin-file-hash
description: file hash cordova extention
---
# cordova-plugin-file-hash
This plugin provides file hash functions

##Platforms
|**Android**|**IOS**|
|:-:|:-:|
|&gt;=5.0|&gt;= 8.0|


If your intrested i search help for an adaptation on Windows Phone(W10 ?), in that case leave a message [here](https://github.com/LordKBX/cordova-plugin-file-hash/issues)

###***list of functions***
|**md2**|**md5**|**sha1**|**sha256**|**sha384**|**sha512**|
|:-:|:-:|:-:|:-:|:-:|:-:|

###***functions usage***

    [window.]FileHash.<function_name>(<file_absolute_path>, callback);

![enter image description here](https://cdn1.iconfinder.com/data/icons/nuove/32x32/actions/messagebox_warning.png) require and absolute path(file:// format, use [cordova-plugin-file](https://www.npmjs.com/package/cordova-plugin-file) for retrieve the appfolder)

the callback function receive a JSON structure, here the result for MD5 hash of a file

    Object{file: "<file_absolute_path>", algo: "<function_algorithm>", result: "<returned_file_hash>"}

![enter image description here](https://cdn2.iconfinder.com/data/icons/freecns-cumulus/32/519791-101_Warning-64.png) if the file not exist the returned hash was an empty string


Exemple on Android

    FileHash.md5(cordova.file.applicationDirectory+'www/index.html',function(e){console.log(e);}

Result

    Object {file: "file:///android_asset/www/index.html", algo: "MD5", result: "5b8a987f7d13a5afa7bb86bb2b0eab90"}


> Written with [StackEdit](https://stackedit.io/).