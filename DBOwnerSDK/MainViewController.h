//
//  MainViewController.h
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-12.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBOwnerLib.h"
#import "AppDelegate.h"

@class DBOwnerAuthLib;

@interface MainViewController : UIViewController<DBOwnerAuthDelegate,DBOwnerAdDelegate>
{
    AppDelegate *appDelegate;
}

@property(retain,nonatomic) DBOwnerAuthLib *dbownerAuth;


@end
