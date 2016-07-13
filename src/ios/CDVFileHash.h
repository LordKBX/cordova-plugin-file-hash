#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVFileHash : CDVPlugin
{}

+ (NSString*)cordovaVersion;

- (void)getDeviceInfo:(CDVInvokedUrlCommand*)command;

@end