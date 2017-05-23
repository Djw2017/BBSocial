//
//  BBSocial.h
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BBSocialCommon.h"
#import "BBSocialPlatformConfig.h"

@interface BBSocial : NSObject

+ (void)setUmSocialAppkey:(NSString *)umSocialAppkey;

/**
 *  获得从sso或者web端回调到本app的回调
 *  必须重载此函数，开发者需重载此方法接受系统回调。
 *
 *  @param url               第三方sdk的打开本app的回调的url
 *  @param sourceApplication 回调的源程序
 *  @param annotation        annotation
 *
 *  @return 是否处理  YES代表处理成功，NO代表不处理
 *
 *  @note 此函数在6.3版本加入
 */
+ (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

/**
 返回当前有效(安装并是可用的)平台列表，不可用原因可能是对应平台key没有配置等等
 
 @return 安装并是可用的
 */
+ (NSArray *)platformTypeArray;

/**
 平台是否安装
 
 @param platformType 平台类型 @see BBSocialPlatformType
 @return YES 代表安装，NO 代表未安装
 @note 在判断QQ空间的App的时候，QQApi判断会出问题
 */
+ (BOOL)isInstall:(BBSocialPlatformType)platformType;

/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
+ (BOOL)isSupport:(BBSocialPlatformType)platformType;

/**
 *  设置平台的appkey
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *  @param appKey       第三方平台的appKey（QQ平台为appID）
 *  @param appSecret    第三方平台的appSecret（QQ平台为appKey）
 *  @param redirectURL  redirectURL
 */
+ (BOOL)setPlaform:(BBSocialPlatformType)platformType
            appKey:(NSString *)appKey
         appSecret:(NSString *)appSecret
       redirectURL:(NSString *)redirectURL;

@end
