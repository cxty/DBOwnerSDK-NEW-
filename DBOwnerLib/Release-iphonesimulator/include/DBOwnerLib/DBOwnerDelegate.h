//
//  DBOwnerDelegate.h
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-4.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#ifndef DBOwnerSDK_DBOwnerDelegate_h
#define DBOwnerSDK_DBOwnerDelegate_h

@class AdView;
@class DBOwnerSocial_Lib;

/*Auth反馈*/
@protocol DBOwnerAuthDelegate<NSObject>

@optional

-(void)authDidStart;
-(void)authDidFinish;
-(void)authDidError;

@end

/*广告反馈*/
@protocol DBOwnerAdDelegate<NSObject>

@optional
//开始请求广告
- (void)adDidStartAd:(AdView *)adView;
//广告接收成功
- (void)adDidReceiveAd:(AdView *)adView;
//广告接收失败
- (void)adDidFailToReceiveAd:(AdView *)adView didFailWithError:(NSError *)error;
//广告点击
- (void)adDidClickAd:(AdView *)adView;
//广告关闭
- (void)adDidCloseAd:(AdView *)adView;


@end

/*社交分享反馈*/
@protocol DBOwnerSocialDelegate<NSObject>

@optional
- (void)didFinishSocialDataInViewController;
@end


#endif
