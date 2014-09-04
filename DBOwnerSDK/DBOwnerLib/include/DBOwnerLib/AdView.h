//
//  AdView.h
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-1.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DBOwnerDelegate.h"


@class DBOwnerLib;

//广告类型
typedef enum AdViewType: int{
    AdViewTypeUnknown = 0, //error
    AdViewTypeNormalBanner = 1, //320 * 50
    AdViewTypeFullScreen = 2, //iphone full screen ad
    AdViewTypeInsertScreen = 3,//
    
    AdViewTypeNormalBannerPad = 4,//728 * 90
    AdViewTypeSmallBannerPad = 5,//936 * 120
    AdViewTypeFullScreenPad = 6,//768 * 1024
    AdViewTypeInsertScreenPad = 7,//560 * 750
 
} AdViewType;

//广告类型对应的大小,高度
#define NormalBanner    50
#define NormalBanner2   48
#define LargeBanner     90
#define LargeBanner2    110
#define MediumBanner    60
#define MediumBanner2   80

#define InsertScreenPaddingW        40
#define InsertScreenPaddingH        76

#define APP_Rect ([ UIScreen mainScreen ].applicationFrame)
#define STATUS_BAR_Rect ([[UIApplication sharedApplication] statusBarFrame])
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SAFE_RELEASE(x) [x release];x=nil
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)



//广告位置
typedef enum{
    Top = 0,
    //Left = 1,
    //Right = 2,
    Bottom = 3,
}AdPosition;

//屏幕方向
typedef enum{
    Landscape = 0,//横
    Portrait = 1,//竖
}AdOrientation;

//分辨率
typedef enum{
    NormalDisplay = 0,//普通
    HeightDisplay = 1,//高清
}AdClarity;

//广告事件类型
typedef enum AdActionType:int{
    UNKNOW = 0,
    OpenWeb = 1,
    CallAPP = 2,
    CallPhone = 3,
    PlayMovie = 4,
    PlayMusic = 5,
    CallMaps = 6,
    CallMail = 7,
    SendSMS = 8,
}AdActionType;


@interface AdView : UIViewController<UIWebViewDelegate,UIGestureRecognizerDelegate>
{
    id<DBOwnerAdDelegate>delegate;
}

@property (retain,nonatomic)NSString *adCode;
@property (retain,nonatomic)NSString *deviceID;
@property (retain,nonatomic)NSString *appID;
@property (retain,nonatomic)NSString *Code;
@property (assign,nonatomic)AdViewType adType;
@property (assign,nonatomic)CGRect adRect;
@property (assign,nonatomic)BOOL adAutoReset;
@property (assign,nonatomic)AdPosition adPosition;
@property (assign,nonatomic)BOOL animationAuto;
@property (retain,nonatomic)NSString *animationType;
@property (retain,nonatomic)NSString *animationSubType;
@property (assign,nonatomic)BOOL showCloseButton;
@property (assign,nonatomic)AdActionType atType;
@property (retain,nonatomic)NSString *atTarget;
@property (retain,nonatomic)NSString *adIdent;
@property (retain,nonatomic)NSString *adHost;
@property (retain,nonatomic)NSString *adURL;
@property (assign,nonatomic)NSInteger adWidth;
@property (assign,nonatomic)NSInteger adHeight;
@property (assign,nonatomic)NSInteger haWidth;
@property (assign,nonatomic)NSInteger haHeight;
@property (assign,nonatomic)UIViewController *adParent;

@property (assign,nonatomic)id<DBOwnerAdDelegate>delegate;

- (id)init:(NSString *)_adCode
  deviceID:(NSString *)_deviceID
     appID:(NSString *)_appID
      Code:(NSString *)_code
    adType:(AdViewType)_adType
    adRect:(CGRect)_adRect
adAutoReset:(BOOL)_adAutoReset
adPosition:(AdPosition)_adPosition
    adHost:(const NSString *)_adHost
  adParent:(UIViewController *)_adParent;

-(void) btCloseClick:(id)sender;
-(void) btAdBarClick:(id)sender;
-(void) btGoClick:(id)sender;

//显示
-(void)show;
//隐藏
-(void)hide;
//关闭
-(void)close;

-(AdActionType) int2AdActionType:(AdActionType) n;

@end


