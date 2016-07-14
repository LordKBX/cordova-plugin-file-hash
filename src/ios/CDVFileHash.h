
#import <Cordova/CDVPlugin.h>

@interface CDVFileHash : CDVPlugin

- (void)md2:(CDVInvokedUrlCommand*)command;
- (void)md5:(CDVInvokedUrlCommand*)command;
- (void)sha1:(CDVInvokedUrlCommand*)command;
- (void)sha256:(CDVInvokedUrlCommand*)command;
- (void)sha384:(CDVInvokedUrlCommand*)command;
- (void)sha512:(CDVInvokedUrlCommand*)command;

@end