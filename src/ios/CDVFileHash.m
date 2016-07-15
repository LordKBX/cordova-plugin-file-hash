#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "CDVFileHash.h"

@interface CDVFileHash () {}
@end

@implementation CDVFileHash

- (void)md2:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"MD2", @"result": @"" };

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			NSData *data = [NSData dataWithContentsOfFile:FileURL];
			unsigned char digest[CC_MD2_DIGEST_LENGTH];
			CC_MD2( data.bytes, (CC_LONG)data.length, digest );
	 
			NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD2_DIGEST_LENGTH * 2];
	 
			for( int i = 0; i < CC_MD2_DIGEST_LENGTH; i++ )
			{
				[output appendFormat:@"%02x", digest[i]];
			}
	 
			deviceProperties = @{ @"file": FileURL, @"algo": @"MD2", @"result": output };
		}
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)md5:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"MD5", @"result": @"" };
	
	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
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
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha1:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-1", @"result": @"" };

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			NSData *data = [NSData dataWithContentsOfFile:FileURL];
			unsigned char digest[CC_SHA1_DIGEST_LENGTH];
			CC_SHA1( data.bytes, (CC_LONG)data.length, digest );
	 
			NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	 
			for( int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ )
			{
				[output appendFormat:@"%02x", digest[i]];
			}
	 
			deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-1", @"result": output };
		}
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha256:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-256", @"result": @"" };

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			NSData *data = [NSData dataWithContentsOfFile:FileURL];
			unsigned char digest[CC_SHA256_DIGEST_LENGTH];
			CC_SHA256( data.bytes, (CC_LONG)data.length, digest );
	 
			NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
	 
			for( int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++ )
			{
				[output appendFormat:@"%02x", digest[i]];
			}
	 
			deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-256", @"result": output };
		}
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha384:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-384", @"result": @"" };

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			NSData *data = [NSData dataWithContentsOfFile:FileURL];
			unsigned char digest[CC_SHA384_DIGEST_LENGTH];
			CC_SHA384( data.bytes, (CC_LONG)data.length, digest );
	 
			NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
	 
			for( int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++ )
			{
				[output appendFormat:@"%02x", digest[i]];
			}
	 
			deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-384", @"result": output };
		}
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha512:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    NSDictionary* deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-512", @"result": @"" };

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			NSData *data = [NSData dataWithContentsOfFile:FileURL];
			unsigned char digest[CC_SHA512_DIGEST_LENGTH];
			CC_SHA512( data.bytes, (CC_LONG)data.length, digest );
	 
			NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
	 
			for( int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++ )
			{
				[output appendFormat:@"%02x", digest[i]];
			}
	 
			deviceProperties = @{ @"file": FileURL, @"algo": @"SHA-512", @"result": output };
		}
	}
	@catch (NSException * e) { NSLog(@"Exception: %@", e); }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceProperties];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

@end