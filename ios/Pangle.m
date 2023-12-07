//
//  Pangle.m
//  PangleDemo
//
//  Created by mile verse on 2023/08/09.
//

#import "Pangle.h"
#import <React/RCTView.h>
#import <React/RCTLog.h>
#import <PAGAdSDK/PAGAdSDK.h>
//#import "RTNEventManager.h"

@interface Pangle ()
@property PAGRewardedAd* rewardedAd;
@end

@implementation Pangle

RCT_EXPORT_MODULE(pangle);

+ (BOOL)requiresMainQueueSetup {
  return YES;
}
- (id)init {
  self = [super init];
  _request = [PAGRewardedRequest request];
  return self;
}

RCT_EXPORT_METHOD(rewardVideoOpen: (NSString *)slotId
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject){
  RCTLog(@"pangle slot id : %@",slotId);
  [PAGRewardedAd loadAdWithSlotID:slotId request:_request completionHandler:^(PAGRewardedAd * _Nullable rewardedAd, NSError * _Nullable error){
    if(error) {
      RCTLog(@"pangle reward ad load fail : %@",error);
      return;
    }
    self.rewardedAd = rewardedAd;
    self.rewardedAd.delegate = self;
    if(self.rewardedAd) {
      UIViewController *myViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
      [rewardedAd presentFromRootViewController:myViewController];
    }
  }];
}

- (void)adDidShow:(PAGRewardedAd *)ad {
  RCTLog(@"jinqook ad show");
}

- (void)adDidClick:(PAGRewardedAd *)ad {
  RCTLog(@"jinqook ad click");
}

- (void)adDidDismiss:(PAGRewardedAd *)ad {
  RCTLog(@"jinqook ad dismiss");
}

- (void)rewardedAd:(PAGRewardedAd *)rewardedAd userDidEarnReward:(PAGRewardModel *)rewardModel {
  RCTLog(@"jinqook reward earned! rewardName:%@ rewardMount:%ld",rewardModel.rewardName,(long)rewardModel.rewardAmount);
//  RTNEventManager *manager = [RTNEventManager allocWithZone:nil];
//  [manager pangleReuslt:@"success"];
  
}

- (void)rewardedAd:(PAGRewardedAd *)rewardedAd userEarnRewardFailWithError:(NSError *)error {
  RCTLog(@"jinqook reward earned failed. Error:%@",error);
//  RTNEventManager *manager = [RTNEventManager allocWithZone:nil];
//  [manager pangleReuslt:@"fail"];
}


@end

