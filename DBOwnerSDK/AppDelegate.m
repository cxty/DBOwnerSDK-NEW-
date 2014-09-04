//
//  AppDelegate.m
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-12.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MenuViewController.h"
#import "AuthViewController.h"

/*===================================App配置信息======================================*/

static const NSString * PUBLIC_KEY              =@"";
static const NSString * PUBLIC_IV               =@"";
static const NSString * APPID                   =@"appx";
static const NSString * APPKEY                  =@"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
static const NSString * ADCODE                  =@"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
static const NSString * CHANNEL_ID              =@"AppleAppStore";

/*=================================App配置信息结束=====================================*/


@implementation AppDelegate

@synthesize dbowner = _dbowner;
@synthesize thisView;
@synthesize mainViewController = _mainViewController;
@synthesize menuViewController = _menuViewController;
@synthesize authViewController = _authViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //必须放第一行,否则代码将出错
    self.dbowner = [[DBOwnerLib alloc] init:[NSString stringWithFormat:@"%@",APPID] AppKey:[NSString stringWithFormat:@"%@",APPKEY] ADCode:[NSString stringWithFormat:@"%@",ADCODE] PublicKey:[NSString stringWithFormat:@"%@",PUBLIC_KEY] PublicIV:[NSString stringWithFormat:@"%@",PUBLIC_IV] ChannelID:[NSString stringWithFormat:@"%@",CHANNEL_ID]];
    [self.dbowner setDebug:YES];
    [self.dbowner didFinishLaunchingWithOptions:launchOptions];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.thisView = [self switchView:@"MainView"];
    
    self.window.rootViewController = self.thisView;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    [self.dbowner applicationWillResignActive:application];
}
//进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.dbowner applicationDidEnterBackground:application];
    
}
//返回前台
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self.dbowner applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self.dbowner applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.dbowner applicationWillTerminate:application];
}

#ifdef __IPHONE_8_0
//ios8需要调用内容
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    //handle the actions
    if ([identifier isEqualToString:@"declineAction"]){
    }
    else if ([identifier isEqualToString:@"answerAction"]){
    }
}

#endif


//接收到本地推送消息
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [self.dbowner didReceiveLocalNotification:notification];
    
}
//当程序运行在后台，接收到消息会有消息提示，点击消息后进入程序
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)payload
{
    [self.dbowner didReceiveRemoteNotification:payload];
}


//iPhone 从APNs服务器获取deviceToken后回调此方法
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [self.dbowner didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    
}

//注册push功能失败 后 返回错误信息，执行相应的处理
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    [self.dbowner didFailToRegisterForRemoteNotificationsWithError:err];
}


+(AppDelegate *)appDelegate{
    return [[UIApplication sharedApplication] delegate];
}

//切换View
-(UIViewController *)switchView:(NSString *)viewName{
    
    NSString *NewViewName = viewName;
    
    if(self.thisView){
        [self.thisView.view setHidden:YES];
    }
    
    if([viewName isEqualToString:@"MenuView"]){//菜单
        
        if (self.menuViewController) {
            [self.menuViewController.view setHidden:NO];
            
            self.thisView = self.menuViewController;
            
        }else{
            self.menuViewController = [[MenuViewController alloc] initWithNibName:NewViewName bundle:nil];
            self.menuViewController.view.frame = CGRectMake(0,20,
                                                  self.menuViewController.view.frame.size.width,
                                                  self.menuViewController.view.frame.size.height);
            [self.window addSubview:self.menuViewController.view];
            [self.menuViewController.view setHidden:NO];
            
            self.thisView = self.menuViewController;
            
        }
    }else if([viewName isEqualToString:@"MainView"]){//主界面
        if (self.mainViewController) {
            [self.mainViewController.view setHidden:NO];
            
            self.thisView = self.mainViewController;
            
        }else{
            self.mainViewController = [[MainViewController alloc] initWithNibName:NewViewName bundle:nil];
            self.mainViewController.view.frame = CGRectMake(0,20,
                                                            self.mainViewController.view.frame.size.width,
                                                            self.mainViewController.view.frame.size.height);
            [self.window addSubview:self.mainViewController.view];
            [self.mainViewController.view setHidden:NO];
            
            self.thisView = self.mainViewController;
            
        }
    }else if ([viewName isEqualToString: @"AuthView"]){//登陆界面
        if (self.authViewController) {
            [self.authViewController.view setHidden:NO];
            
            self.thisView = self.authViewController;
            
        }else{
            self.authViewController = [[AuthViewController alloc] initWithNibName:NewViewName bundle:nil];
            self.authViewController.view.frame = CGRectMake(0,20,
                                                               self.authViewController.view.frame.size.width,
                                                               self.authViewController.view.frame.size.height);
            [self.window addSubview:self.authViewController.view];
            [self.authViewController.view setHidden:NO];
            
            self.thisView = self.authViewController;
            
        }
    }else{
        return nil;
    }
    
    self.window.rootViewController = self.thisView;
    return self.thisView;
}

@end
