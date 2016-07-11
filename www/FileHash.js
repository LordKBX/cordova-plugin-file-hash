var argscheck = require('cordova/argscheck'),
    channel = require('cordova/channel'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec'),
    cordova = require('cordova');
	
function FileHash() {
    channel.onCordovaReady.subscribe(function() { });
};
		
FileHash.prototype.md2 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "md2", [urlFile]);
};	
FileHash.prototype.md5 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "md5", [urlFile]);
};	
FileHash.prototype.sha1 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "sha1", [urlFile]);
};	
FileHash.prototype.sha256 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "sha256", [urlFile]);
};	
FileHash.prototype.sha384 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "sha384", [urlFile]);
};	
FileHash.prototype.sha512 = function(urlFile, successCallback, errorCallback) {
   exec(successCallback, errorCallback, "FileHash", "sha512", [urlFile]);
};

module.exports = new FileHash();
