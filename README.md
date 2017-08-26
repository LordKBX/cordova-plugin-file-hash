# cordova-plugin-file-hash
This plugin provides file hash functions
##Version 0.4.1
##Platforms
|**Android**|**IOS**|
|:---:|:---:|
|&gt;=5.0|&gt;= 8.0|


If your intrested i search help for an adaptation on Windows Phone(W10 ?), in that case leave a message [here](https://github.com/LordKBX/cordova-plugin-file-hash/issues)

###***list of functions***
|**md2**|**md5**|**sha1**|**sha256**|**sha384**|**sha512**|
|:---:|:---:|:---:|:---:|:---:|:---:|

###***functions usage***

    [window.]FileHash.<function>(<file_absolute_path>, successCallback, errorCallback);

![warning](https://cdn1.iconfinder.com/data/icons/nuove/32x32/actions/messagebox_warning.png) require and absolute path(file:// format, use [cordova-plugin-file](https://www.npmjs.com/package/cordova-plugin-file) for retrieve the appfolder)

the successCallback function receive a JSON structure, here the content of the structure

    Object{file: "<file_absolute_path>", algo: "<algorithm>", result: "<file_hash>"}

the errorCallback function receive a JSON structure, here the content of the structure

    Object{code: <int_return_code>, message: "<error_description>"}
	
###***List of error codes***
|code|message|additional informations|
|:---:|:---|:---|
|0|Execution Error|unknow error|
|1|Unknown Algorithm|only if you do somthing stupid with the plugin code|
|2|File not found|on IOS was also send in case of access error|
|3|File access error|no sufficents access rights or already used file|
|4|Digest error|cryptography processing error|

###***Exemple on Android***
![warning](https://cdn1.iconfinder.com/data/icons/nuove/32x32/actions/messagebox_warning.png) this exemple use [cordova-plugin-file](https://www.npmjs.com/package/cordova-plugin-file) for retrieve the appfolder(cordova.file.applicationDirectory)

    FileHash.md5(cordova.file.applicationDirectory+'www/index.html',
		function(e){console.log(e);})

Result

    Object {file: "file:///android_asset/www/index.html", algo: "MD5",
		result: "5b8a987f7d13a5afa7bb86bb2b0eab90"}


> Written with [StackEdit](https://stackedit.io/).