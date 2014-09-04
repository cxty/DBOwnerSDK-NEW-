//
//  AppDelegate.h
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-12.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBOwnerLib/include/DBOwnerLib/DBOwnerLib.h" //DBOwner静态库


#define MAINHEIGHT [[UIScreen mainScreen] bounds].size.height
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@class DBOwnerLib;

@class MainViewController;
@class MenuViewController;
@class AuthViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (retain, nonatomic) DBOwnerLib *dbowner;//不能修改名称，否则编译无法通过

@property (retain, nonatomic) UIViewController *thisView;
@property (retain, nonatomic) MainViewController *mainViewController;
@property (retain, nonatomic) MenuViewController *menuViewController;
@property (retain, nonatomic) AuthViewController *authViewController;

//切换View
-(UIViewController *)switchView:(NSString *)viewName;
+(AppDelegate *)appDelegate;

@end
