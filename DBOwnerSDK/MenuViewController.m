//
//  MenuViewController.m
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-11-12.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
    [DBOwnerLib addTrackView:self Code:@"MenuView"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getUserInfo:(UIButton *)sender {
    NSJSONSerialization *re =[[AppDelegate appDelegate].dbowner GetUserInfo];
    NSString *re_str = [[NSString alloc]
                        initWithData:[NSJSONSerialization
                                      dataWithJSONObject:re
                                      options:NSJSONWritingPrettyPrinted error:nil]
                        encoding:NSUTF8StringEncoding];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:re_str delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}
- (IBAction)chechAccessToken:(UIButton *)sender {
    BOOL re = [[AppDelegate appDelegate].dbowner CheckAccessToken];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:[NSString stringWithFormat:@"%s",re==YES?"YES":"NO"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)reAccessToken:(UIButton *)sender {
    BOOL re = [[AppDelegate appDelegate].dbowner RefreshAccessToken];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:[NSString stringWithFormat:@"%s",re==YES?"YES":"NO"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)getMsgList:(UIButton *)sender {
    NSJSONSerialization *re = [[AppDelegate appDelegate].dbowner GetNewMsg:10 Page:1];
    NSString *re_str = [[NSString alloc]
                        initWithData:[NSJSONSerialization
                                      dataWithJSONObject:re
                                      options:NSJSONWritingPrettyPrinted error:nil]
                        encoding:NSUTF8StringEncoding];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:re_str delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)getUserAppList:(UIButton *)sender {
    NSJSONSerialization *re = [[AppDelegate appDelegate].dbowner GetUserAppList];
    NSString *re_str = [[NSString alloc]
                        initWithData:[NSJSONSerialization
                                      dataWithJSONObject:re
                                      options:NSJSONWritingPrettyPrinted error:nil]
                        encoding:NSUTF8StringEncoding];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:re_str delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)getData:(UIButton *)sender {
    NSJSONSerialization *re = [[AppDelegate appDelegate].dbowner GetAppInfo];
    NSString *re_str = [[NSString alloc]
                        initWithData:[NSJSONSerialization
                                      dataWithJSONObject:re
                                      options:NSJSONWritingPrettyPrinted error:nil]
                        encoding:NSUTF8StringEncoding];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:re_str delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (IBAction)logOut:(UIButton *)sender {
    NSString *re = [[AppDelegate appDelegate].dbowner Signout];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Msg" message:re delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

//显示全屏广告
- (IBAction)ShowAd_full:(UIButton *)sender {

    AdView *ad_full = [DBOwnerLib addAd_FullScreen:self Code:@"MenuView_ShowAd_full"];
    [ad_full setDelegate:self];

}

//显示插屏广告
- (IBAction)ShowAd_insert:(UIButton *)sender {

    AdView *ad_InsertScreen = [DBOwnerLib addAd_InsertScreen:self Code:@"MenuView_ShowAd_insert"];
    [ad_InsertScreen setDelegate:self];
}

//显示横条广告
- (IBAction)ShowAd_bar:(UIButton *)sender {

    AdView *ad_B_T = [DBOwnerLib addAd_Banner:self Code:@"MenuView_ShowAd_bar_top" Position:Top];
    [ad_B_T setDelegate:self];
}
- (IBAction)ShowAd_bar_bottom:(id)sender {

    AdView *ad_B_B = [DBOwnerLib addAd_Banner:self Code:@"MenuView_ShowAd_bar_bottom" Position:Bottom];
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
