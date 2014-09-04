//
//  DBOwnerLib.h
//  DBOwnerSDK
//
//  Created by Chen Gan on 13-10-10.
//  Copyright (c) 2013年 Yannyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIApplication.h>
#import "AdView.h"

@class DBOwnerNetLib;
@class DBOwnerViewLib;
@class DBOwnerAuthLib;
@class AdView;

@interface DBOwnerLib : NSObject

@property(assign,nonatomic) BOOL Debug;
@property(retain,nonatomic) NSMutableDictionary *dbownerViewDict;
@property(retain,nonatomic) NSString *device_token;
@property(retain,nonatomic) NSString *device_token_old;
@property(retain,nonatomic) NSString *drive_id;
@property(retain,nonatomic) NSString *public_key;
@property(retain,nonatomic) NSString *public_iv;
@property(retain,nonatomic) NSString *auth_host;
@property(retain,nonatomic) NSString *auth_authorize_url;
@property(retain,nonatomic) NSString *auth_token_url;
@property(retain,nonatomic) NSString *auth_requestToken_url;
@property(retain,nonatomic) NSString *auth_recall_url;
@property(retain,nonatomic) NSString *app_api;
@property(retain,nonatomic) NSString *consumer_key;
@property(retain,nonatomic) NSString *consumer_secret;
@property(retain,nonatomic) NSString *ad_code;
@property(retain,nonatomic) NSString *channel_id;
@property(retain,nonatomic) NSString *access_token;
@property(retain,nonatomic) NSString *refresh_token;
@property(retain,nonatomic) NSString *userid;
@property(retain,nonatomic) NSString *pushserver_host;
@property(retain,nonatomic) NSString *pushserver_port;
@property(retain,nonatomic) NSString *drive_token;
@property(nonatomic) SecKeyRef rsa_public_key;


/************************************公共部分************************************/
-(id)init:(NSString *)AppID AppKey:(NSString *)AppKey ADCode:(NSString *)ADCode PublicKey:(NSString *)PublicKey PublicIV:(NSString *)PublicVI ChannelID:(NSString *)ChannelID;
-(void)dealloc;

+(DBOwnerLib *)instance;


//log
-(void)Log:(NSString *)msg;

//是否已越狱
+(BOOL)isJailbroken;

//取UDID
-(NSString *)GetDriveID;

//取当前时间
+(NSTimeInterval)GetThisTime;

//读取配置信息
-(void)readConfig;

//保存配置信息
-(void)saveConfig;

//取RSAPublicKey
+(SecKeyRef)GetRSAPublicKey;
//DES加密
+ (NSString *)DESEncrypt:(NSString *)plainText WithKey:(NSString *)key;
//DES解密
+ (NSString *)DESDecrypt:(NSString *)cipherText WithKey:(NSString *)key;
//ASE加密
+ (NSData *)ase_encrypt:(NSData *)value aesKey:(NSString *)keyString;
//ASE解密
+ (NSData *)ase_decrypt:(NSData *)encryptString aesKey:(NSString *)keyString;

//加密
+(NSString *)D_Encrypt:(NSString *)value;
//解密
+(NSString *)D_Decrypt:(NSString *)encryptString;

//解密
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key iv:(NSString *)iv;
//加密
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key iv:(NSString *)iv;


//写文件到本地,返回文件地址
+(NSString *)File:(const NSString *)FileName;

//删除指定本地数据
+(void)removeLocationData:(unsigned int)Code;
+(void)removeLocationErrorData:(unsigned int)Code;

/*******************************************************************************/


/********************************托管系统部分回调**********************************/
-(void) didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
-(void) applicationWillResignActive:(UIApplication *)application;
-(void) applicationDidEnterBackground:(UIApplication *)application;
-(void) applicationWillEnterForeground:(UIApplication *)application;
-(void) applicationDidBecomeActive:(UIApplication *)application;
-(void) applicationWillTerminate:(UIApplication *)application;
-(void) didReceiveLocalNotification:(UILocalNotification *)notification;
-(void) didReceiveRemoteNotification:(NSDictionary *)payload;
-(void) didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
-(void) didFailToRegisterForRemoteNotificationsWithError:(NSError *)err;
/*******************************************************************************/



/**********************************Auth用户中心部分************************************/
-(void)SetAuthDelegate:(id)delegate;
//用户登陆
-(void)Login:(UIViewController *)AuthWebViewController;
//退出登陆
-(NSString *)Signout;
//取用户信息
- (NSJSONSerialization *)GetUserInfo;
- (NSJSONSerialization *)GetUserInfoByName:(NSString *)UserName;
- (NSJSONSerialization *)GetUserInfoByID:(NSString *)UserID;
//验证Access_Token
- (BOOL)CheckAccessToken;
//刷新Access_Token
- (BOOL)RefreshAccessToken;
//取用户订购应用列表
- (NSJSONSerialization *)GetUserAppList;
//发送短信息
-(bool)SendMsg:(NSString *)Accepter Title:(NSString *)Title Content:(NSString *)Content;
//取用户未读短信息列表
-(NSJSONSerialization *)GetNewMsg:(int)PageSize Page:(int)Page;
//取用户已读短信息列表
-(NSJSONSerialization *)GetReadMsg:(int)PageSize Page:(int)Page;
//取用户已发送信息列表
-(NSJSONSerialization *)GetSendMsg:(int)PageSize Page:(int)Page;
//取用户已删除信息列表
-(NSJSONSerialization *)GetDelMsg:(int)PageSize Page:(int)Page;
//删除短信息
-(BOOL)DelMsg:(int)MsgID Type:(int)Type;
/************************************************************************************/


/**********************************View记录分析部分************************************/
//添加记录View
+(void)addTrackView:(UIViewController *)View Code:(NSString *)Code;
//删除记录View
+(void)removeTrackView:(UIViewController *)View;
/************************************************************************************/


/********************************DBEngine数据引擎部分**********************************/
//获取应用信息
-(NSJSONSerialization *)GetAppInfo;
//获取指定数据对象信息
-(NSJSONSerialization *)GetAppDataObj:(NSString *)Data;
//获取数据对象列表
-(NSJSONSerialization *)GetAppDataObjList;
//查询应用数据
-(NSJSONSerialization *)FindAppData:(NSString *)Data;
//插入应用数据
-(NSJSONSerialization *)SaveAppData:(NSString *)Data;
//更新应用数据
-(NSJSONSerialization *)UpdateAppData:(NSString *)Data;
//删除应用数据
-(NSJSONSerialization *)RemoveAppData:(NSString *)Data;
//上传文件,来自本地文件
-(NSJSONSerialization *)UpFile:(NSString *)FilePath;
//上传文件,来自数据流
-(NSJSONSerialization *)UpFileData:(NSData *)FileData;
//列出应用文件
-(NSJSONSerialization *)ListFile:(NSString *)Data;
//删除文件
-(NSJSONSerialization *)DeleteFile:(NSString *)Data;
/************************************************************************************/


/****************************************AD部分***************************************/

//添加广告
+(AdView *)addAd_FullScreen:(UIViewController *)viewController Code:(NSString *)code;
+(AdView *)addAd_InsertScreen:(UIViewController *)viewController Code:(NSString *)code;
+(AdView *)addAd_Banner:(UIViewController *)viewController Code:(NSString *)code Position:(AdPosition)position;
/************************************************************************************/

@end
