//
//  MainViewController.m
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-12.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [DBOwnerLib addTrackView:self Code:@"MainView"];
    //NSString* _t = [DBOwnerLib encryptUseDES:@"123,.;'[]qawsed中文" key:@"1q2w3e4r" iv:@"12345678"];
    //NSLog(@"%@",_t);
    
    //NSLog(@"%@",[DBOwnerLib decryptUseDES:_t key:@"1q2w3e4r" iv:@"12345678"]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Login:(UIButton *)sender {
    UIViewController *AuthView = [[AppDelegate appDelegate] switchView:@"AuthView"];
    if (AuthView != nil) {
        
        [[AppDelegate appDelegate].dbowner SetAuthDelegate:self];
        [[AppDelegate appDelegate].dbowner Login:AuthView];
        
    }
}

-(void)authDidStart
{
    NSLog(@"AuthStart");
}
-(void)authDidFinish
{
    NSLog(@"AuthFinish");
    UIViewController *MenuView = [[AppDelegate appDelegate] switchView:@"MenuView"];
    if (MenuView != nil) {
        
    }
}
-(void)authDidError
{
    NSLog(@"AuthError");
}



- (IBAction)ShowFullAd:(UIButton *)sender {
    AdView *ad_full = [DBOwnerLib addAd_FullScreen:self Code:@"MainView_ShowFullAd"];
    [ad_full setDelegate:self];
}
- (IBAction)ShowInAd:(UIButton *)sender {
    AdView *ad_InsertScreen = [DBOwnerLib addAd_InsertScreen:self Code:@"MainView_ShowInsertAd"];
    [ad_InsertScreen setDelegate:self];
}
- (IBAction)ShowTopBarAd:(UIButton *)sender {
    AdView *ad_B_T = [DBOwnerLib addAd_Banner:self Code:@"MainView_ShowTopBarAd" Position:Top];
    [ad_B_T setDelegate:self];
}
- (IBAction)ShowBottomBarAd:(UIButton *)sender {
    AdView *ad_B_B = [DBOwnerLib addAd_Banner:self Code:@"MainView_ShowBottomBarAd" Position:Bottom];
    [ad_B_B setDelegate:self];
}

-(void)adDidClickAd:(AdView *)adView
{
    NSLog(@"ClickAd:%@",adView.Code);
}

-(void)adDidCloseAd:(AdView *)adView
{
    NSLog(@"CloseAd:%@",adView.Code);
}

-(void)adDidStartAd:(AdView *)adView
{
    NSLog(@"StartAd:%@",adView.Code);
}

-(void)adDidReceiveAd:(AdView *)adView
{
    NSLog(@"ReceiveAd:%@",adView.Code);
}
-(void)adDidFailToReceiveAd:(AdView *)adView didFailWithError:(NSError *)error
{
    NSLog(@"ReceiveAdError:%@,Error:%@",adView.Code,error);
}
@end
