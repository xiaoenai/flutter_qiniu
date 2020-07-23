#import "FlutterQiniuPlugin.h"

@implementation FlutterQiniuPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel =
    [FlutterMethodChannel methodChannelWithName:@"plugins.xiaoenai.com/flutter_qiniu"
                                binaryMessenger:[registrar messenger]];
    FlutterQiniuPlugin *instance = [[FlutterQiniuPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    [registrar addApplicationDelegate:instance];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"aaaaa" isEqualToString:call.method]) {

    } else {
        result(FlutterMethodNotImplemented);
    }
}



@end
