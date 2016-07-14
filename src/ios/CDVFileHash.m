#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "CDVFileHash.h"

@interface CDVFileHash () {}
@end

@implementation CDVFileHash

- (void)md2:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"MD2", @"result": @"" };


	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)md5:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"MD5", @"result": @"" };
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	// Make sure the file exists
	if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
	{
		NSData *data = [NSData dataWithContentsOfFile:FileURL];
		unsigned char digest[CC_MD5_DIGEST_LENGTH];
		CC_MD5( data.bytes, (CC_LONG)data.length, digest );
 
		NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
 
		for( int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ )
		{
			[output appendFormat:@"%02x", digest[i]];
		}
 
		deviceProperties = @{ @"file": FileURL, @"algo": @"MD5", @"result": output };
	}

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sha1:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-1", @"result": @"" };


	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sha256:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-256", @"result": @"" };


	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sha384:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-384", @"result": @"" };


	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sha512:(CDVInvokedUrlCommand*)command {
	NSString* FileURL = [command argumentAtIndex:0];
	NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-512", @"result": @"" };


	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end