//
//  BBSocial.m
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UMSocialCore/UMSocialCore.h>

#import "BBSocial.h"

@implementation BBSocial

+ (void)setUmSocialAppkey:(NSString *)umSocialAppkey {
    [[UMSocialManager defaultManager] setUmSocialAppkey:umSocialAppkey];
}

/**
 *  获得从sso或者web端回调到本app的回调
 *
 *  @param url               第三方sdk的打开本app的回调的url
 *  @param sourceApplication 回调的源程序
 *  @param annotation        annotation
 *
 *  @return 是否处理  YES代表处理成功，NO代表不处理
 *
 *  @note 此函数在6.3版本加入
 */
+ (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

/**
 返回当前有效(安装并是可用的)平台列表，不可用原因可能是对应平台key没有配置等等
 
 @return 安装并是可用的
 */
+ (NSArray *)platformTypeArray {
    return [[UMSocialManager defaultManager] platformTypeArray];
}

/**
 平台是否安装
 
 @param platformType 平台类型 @see BBSocialPlatformType
 @return YES 代表安装，NO 代表未安装
 @note 在判断QQ空间的App的时候，QQApi判断会出问题
 */
+ (BOOL)isInstall:(BBSocialPlatformType)platformType {
    return [[UMSocialManager defaultManager] isInstall:(UMSocialPlatformType)platformType];
}

/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see BBSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
+ (BOOL)isSupport:(BBSocialPlatformType)platformType {
    return [[UMSocialManager defaultManager] isSupport:(UMSocialPlatformType)platformType];
}

/**
 *  设置平台的appkey
 *
 *  @param platformType 平台类型 @see BBSocialPlatformType
 *  @param appKey       第三方平台的appKey（QQ平台为appID）
 *  @param appSecret    第三方平台的appSecret（QQ平台为appKey）
 *  @param redirectURL  redirectURL
 */
+ (BOOL)setPlaform:(BBSocialPlatformType)platformType
            appKey:(NSString *)appKey
         appSecret:(NSString *)appSecret
       redirectURL:(NSString *)redirectURL {
    
    UMSocialPlatformType umPlatformType = [BBSocialCommon umSocialTypeWithBBShareType:platformType];
    [[UMSocialManager defaultManager] setPlaform:umPlatformType appKey:appKey appSecret:appSecret redirectURL:redirectURL];
    return YES;
}

@end
