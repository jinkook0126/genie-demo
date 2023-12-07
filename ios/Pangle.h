//
//  Pangle.h
//  PangleDemo
//
//  Created by mile verse on 2023/08/09.
//

#import <React/RCTBridgeModule.h>
#import <PAGAdSDK/PAGAdSDK.h>

@interface Pangle : UIViewController<RCTBridgeModule,PAGRewardedAdDelegate>
@property(nonatomic, strong) UIViewController *rootViewController;
@property(nonatomic, strong) PAGRewardedRequest *request;
@end
