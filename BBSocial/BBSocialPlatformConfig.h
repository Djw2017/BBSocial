//
//  BBSocialPlatformConfig.h
//  BBSocial
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 分享平台
typedef NS_ENUM(NSInteger,BBSocialPlatformType)
{
    BBSocialPlatformType_UnKnown            = -2,
    //预定义的平台
    BBSocialPlatformType_Predefine_Begin    = -1,
    /// 新浪
    BBSocialPlatformType_Sina               = 0,
    /// 微信聊天
    BBSocialPlatformType_WechatSession      = 1,
    /// 微信朋友圈
    BBSocialPlatformType_WechatTimeLine     = 2,
    BBSocialPlatformType_WechatFavorite     = 3,//微信收藏
    /// QQ聊天页面
    BBSocialPlatformType_QQ                 = 4,
    BBSocialPlatformType_Qzone              = 5,//qq空间
    BBSocialPlatformType_TencentWb          = 6,//腾讯微博
    BBSocialPlatformType_AlipaySession      = 7,//支付宝聊天页面
    BBSocialPlatformType_YixinSession       = 8,//易信聊天页面
    BBSocialPlatformType_YixinTimeLine      = 9,//易信朋友圈
    BBSocialPlatformType_YixinFavorite      = 10,//易信收藏
    BBSocialPlatformType_LaiWangSession     = 11,//点点虫（原来往）聊天页面
    BBSocialPlatformType_LaiWangTimeLine    = 12,//点点虫动态
    BBSocialPlatformType_Sms                = 13,//短信
    BBSocialPlatformType_Email              = 14,//邮件
    BBSocialPlatformType_Renren             = 15,//人人
    BBSocialPlatformType_Facebook           = 16,//Facebook
    BBSocialPlatformType_Twitter            = 17,//Twitter
    BBSocialPlatformType_Douban             = 18,//豆瓣
    BBSocialPlatformType_KakaoTalk          = 19,//KakaoTalk
    BBSocialPlatformType_Pinterest          = 20,//Pinteres
    BBSocialPlatformType_Line               = 21,//Line
    
    BBSocialPlatformType_Linkedin           = 22,//领英
    
    BBSocialPlatformType_Flickr             = 23,//Flickr
    
    BBSocialPlatformType_Tumblr             = 24,//Tumblr
    BBSocialPlatformType_Instagram          = 25,//Instagram
    BBSocialPlatformType_Whatsapp           = 26,//Whatsapp
    BBSocialPlatformType_DingDing           = 27,//钉钉
    
    BBSocialPlatformType_YouDaoNote         = 28,//有道云笔记
    BBSocialPlatformType_EverNote           = 29,//印象笔记
    BBSocialPlatformType_GooglePlus         = 30,//Google+
    BBSocialPlatformType_Pocket             = 31,//Pocket
    BBSocialPlatformType_DropBox            = 32,//dropbox
    BBSocialPlatformType_VKontakte          = 33,//vkontakte
    BBSocialPlatformType_FaceBookMessenger  = 34,//FaceBookMessenger
    
    BBSocialPlatformType_Predefine_end      = 999,
    
    //用户自定义的平台
    BBSocialPlatformType_UserDefine_Begin = 1000,
    BBSocialPlatformType_UserDefine_End = 2000,
};



/**
 返回错误类型
 */
typedef NS_ENUM(NSInteger, BBSocialPlatformErrorType) {
    BBSocialPlatformErrorType_Unknow            = 2000,            // 未知错误
    BBSocialPlatformErrorType_NotSupport        = 2001,            // 不支持（url scheme 没配置，或者没有配置-ObjC， 或则SDK版本不支持或则客户端版本不支持）
    BBSocialPlatformErrorType_AuthorizeFailed   = 2002,            // 授权失败
    BBSocialPlatformErrorType_ShareFailed       = 2003,            // 分享失败
    BBSocialPlatformErrorType_RequestForUserProfileFailed = 2004,  // 请求用户信息失败
    BBSocialPlatformErrorType_ShareDataNil      = 2005,             // 分享内容为空
    BBSocialPlatformErrorType_ShareDataTypeIllegal = 2006,          // 分享内容不支持
    BBSocialPlatformErrorType_CheckUrlSchemaFail = 2007,            // schemaurl fail
    BBSocialPlatformErrorType_NotInstall        = 2008,             // 应用未安装
    BBSocialPlatformErrorType_Cancel            = 2009,             // 取消操作
    BBSocialPlatformErrorType_NotNetWork        = 2010,             // 网络异常
    BBSocialPlatformErrorType_SourceError       = 2011,             // 第三方错误
    
    BBSocialPlatformErrorType_ProtocolNotOverride = 2013,   // 对应的	BBSocialPlatformProvider的方法没有实现
    BBSocialPlatformErrorType_NotUsingHttps      = 2014,   // 没有用https的请求,@see BBSocialGlobal isUsingHttpsWhenShareContent
    
};

/**
 授权，分享，UserProfile等操作的回调
 
 @param data 平台回调结果
 @param error 分享内容失败的错误信息
 */
typedef void(^BBSocialRequestCompletionHandler)(id data, NSError *error);


@interface BBSocialPlatformConfig : NSObject

@end
