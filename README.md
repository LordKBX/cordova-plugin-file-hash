---
title: cordova-plugin-file-hash
description: file hash cordova extention
---
# cordova-plugin-file-hash
This plugin provides file hash functions

Platforms: **Android**(tested in 5.0 for the lowest), **IOS**(>=8.0 form Apple doc info)

If your intrested i search help for an adaptation on Windows Phone(W10 ?), in that case leave a message [here](https://github.com/LordKBX/cordova-plugin-file-hash/issues)

###***list of functions***
**md2**
**md5**
**sha1**
**sha256**
**sha384**
**sha512**

all the functions return a JSON structure, if the file not exist the returned hash was an empty string
require and absolute path(file:// format)

Exemple
`FileHash.md5("<file absolute path>",function(e){console.log(e);}`

Result
`Object {file: "<file absolute path>", algo: "MD5", result: "5b8a987f7d13a5afa7bb86bb2b0eab90"}`


> Written with [StackEdit](https://stackedit.io/).