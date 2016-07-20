#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "CDVFileHash.h"

@interface CDVFileHash () {}
@end


@implementation CDVFileHash

- (void)md2:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_MD2_DIGEST_LENGTH];
				CC_MD2( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD2_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_MD2_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"MD2", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)md5:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_MD5_DIGEST_LENGTH];
				CC_MD5( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"MD5", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha1:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_SHA1_DIGEST_LENGTH];
				CC_SHA1( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"SHA-1", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha256:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_SHA256_DIGEST_LENGTH];
				CC_SHA256( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"SHA-256", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha384:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_SHA384_DIGEST_LENGTH];
				CC_SHA384( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"SHA-384", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

- (void)sha512:(CDVInvokedUrlCommand*)command {
    NSString* FileURL = [[[[command argumentAtIndex:0] stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"] stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByRemovingPercentEncoding];
    CDVPluginResult* pluginResult = nil;

	@try {
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if( [fileManager fileExistsAtPath:FileURL isDirectory:nil] )
		{
			if( [fileManager isReadableFileAtPath:FileURL] )
			{
				NSData *data = [NSData dataWithContentsOfFile:FileURL]; unsigned char digest[CC_SHA512_DIGEST_LENGTH];
				CC_SHA512( data.bytes, (CC_LONG)data.length, digest ); NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
		 
				for( int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++ ) { [output appendFormat:@"%02x", digest[i]]; }
		 
				NSDictionary* hashProperties = @{ @"file": FileURL, @"algo": @"SHA-512", @"result": output };
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:hashProperties];
			}
			else { NSException* execp = [NSException exceptionWithName:@"NoFileAccess" reason:@"_-_" userInfo:nil]; @throw execp; }
		}
		else { NSException* execp = [NSException exceptionWithName:@"FileNotFound" reason:@"_-_" userInfo:nil]; @throw execp; }
	}
	@catch (NSException * e) {
		NSDictionary* errorProperties = @{ @"code": [NSNumber numberWithInt:4], @"message":[errorList valueForKey:@"4"]};
		if([[e name] isEqualToString:@"FileNotFound"]){errorProperties = @{ @"code": [NSNumber numberWithInt:2], @"message": [errorList valueForKey:@"2"]};}
		if([[e name] isEqualToString:@"NoFileAccess"]){errorProperties = @{ @"code": [NSNumber numberWithInt:3], @"message": [errorList valueForKey:@"3"]};}
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorProperties];
		}

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}

@end