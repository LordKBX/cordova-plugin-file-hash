
#import <Cordova/CDVPlugin.h>
#define errorList @{ @"0": @"Execution Error", @"1": @"Unknown Algorithm", @"2": @"File not found", @"3": @"File access error", @"4": @"Digest error" }

@interface CDVFileHash : CDVPlugin

- (void)md2:(CDVInvokedUrlCommand*)command;
- (void)md5:(CDVInvokedUrlCommand*)command;
- (void)sha1:(CDVInvokedUrlCommand*)command;
- (void)sha256:(CDVInvokedUrlCommand*)command;
- (void)sha384:(CDVInvokedUrlCommand*)command;
- (void)sha512:(CDVInvokedUrlCommand*)command;

@end