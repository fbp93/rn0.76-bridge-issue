#import "TestEmitter.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(TestEmitter, RCTEventEmitter)
RCT_EXTERN_METHOD(sendEventToJS)
@end
