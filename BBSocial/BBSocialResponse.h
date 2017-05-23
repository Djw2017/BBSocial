//
//  BBLoginResponse.h
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBSocialPlatformConfig.h"

/**
 第三方登录数据(为空表示平台未提供)
 */
@interface BBSocialResponse : NSObject

/**
 用户唯一标识
 QQ原始字段名:openid,微信原始字段名:unionid,新浪原始字段名:	id
 */
@property (nonatomic, copy) NSString  *uid;

/**
 添加已授权的腾讯微博和qq空间账号，需要用到的openId
 */
@property (nonatomic, copy) NSString  *openid;

/**
 授权到微信用到的refreshToken
 */
@property (nonatomic, copy) NSString  *refreshToken;

/**
 授权的过期时间
 */
@property (nonatomic, copy) NSDate    *expiration;

/**
 用户授权后得到的accessToken
 */
@property (nonatomic, copy) NSString  *accessToken;

/**
 微信授权完成后得到的unionId
 
 */
@property (nonatomic, copy) NSString  *unionId;

@property (nonatomic, assign) BBSocialPlatformType  platformType;

/**
 * 第三方原始数据
 */
@property (nonatomic, strong) id  originalResponse;

@end




@interface BBSocialUserInfoResponse : BBSocialResponse

/**
 第三方平台昵称
 */
@property (nonatomic, copy) NSString  *name;

/**
 第三方平台头像地址
 */
@property (nonatomic, copy) NSString  *iconurl;

/**
 通用平台性别属性
 QQ、微信、微博返回 "男", "女"
 Facebook返回 "male", "female"
 */
@property (nonatomic, copy) NSString  *unionGender;

/**
 该字段会直接返回男女
 */
@property (nonatomic, copy) NSString  *gender;

- (NSString *)description;

@end
