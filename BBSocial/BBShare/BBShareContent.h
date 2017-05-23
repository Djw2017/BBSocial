//
//  BBShareContent.h
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialMessageObject.h>

/**
 分享内容,纯文本
 */
@interface BBShareContent : NSObject

/**
 标题，某些平台无效
 */
@property (nonatomic, copy) NSString *title;

/**
 描述
 */
@property (nonatomic, copy) NSString *descr;

/**
 缩略图 UIImage或者NSData类型或者NSString类型（图片url）
 */
@property (nonatomic, strong) id thumbImage;

/**
 * 其他相关参数，见相应平台说明
 */
@property (nonatomic, strong) NSDictionary *moreInfo;

/**
 宝宝巴士ShareContent类型转换为友盟UMSocialMessageObject（根）类型

 @param content 需要被转换的BBShareContent
 @return UMSocialMessageObject *
 */
+ (UMSocialMessageObject *)umSocialMessageObjectWithBBShareContent:(BBShareContent *)content;

@end




#pragma mark - ImageContent
@interface BBShareImageContent : BBShareContent

/** 图片内容 （可以是UIImage类对象，也可以是NSdata类对象，也可以是图片链接imageUrl NSString类对象）
 * @note 图片大小根据各个平台限制而定
 */
@property (nonatomic, retain) id shareImage;

/**
 返回一个拥有图片属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url
 @return BBShareImageContent
 */
+ (BBShareImageContent *)shareContentWithTitle:(NSString *)title
                                       descr:(NSString *)descr
                                   thBBImage:(id)thBBImage;

@end




#pragma mark - MusicContent
@interface BBShareMusicContent : BBShareContent

/** 音乐网页的url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicUrl;
/** 音乐lowband网页的url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicLowBandUrl;
/** 音乐数据url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicDataUrl;

/**音乐lowband数据url地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *musicLowBandDataUrl;

/**
 * @param title 标题
 * @param descr 描述
 * @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 *
 */
+ (BBShareMusicContent *)shareContentWithTitle:(NSString *)title
                                       descr:(NSString *)descr
                                   thBBImage:(id)thBBImage;

@end




#pragma mark - VideoContent
@interface BBShareVideoContent : BBShareContent

/**
 视频网页的url
 
 @warning 不能为空且长度不能超过255
 */
@property (nonatomic, strong) NSString *videoUrl;

/**
 视频lowband网页的url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoLowBandUrl;

/**
 视频数据流url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoStreamUrl;

/**
 视频lowband数据流url
 
 @warning 长度不能超过255
 */
@property (nonatomic, strong) NSString *videoLowBandStreamUrl;


/**
 * @param title 标题
 * @param descr 描述
 * @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 *
 */
+ (BBShareVideoContent *)shareContentWithTitle:(NSString *)title
                                       descr:(NSString *)descr
                                   thBBImage:(id)thBBImage;

@end




#pragma mark - WebpageContent
@interface BBShareWebpageContent : BBShareContent

/** 网页的url地址
 * @note 不能为空且长度不能超过10K
 */
@property (nonatomic, retain) NSString *webpageUrl;

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (BBShareWebpageContent *)shareContentWithTitle:(NSString *)title
                                         descr:(NSString *)descr
                                     thBBImage:(id)thBBImage;

@end




#pragma mark - EmailContent
/*
 *  分享消息中的邮件分享对象
 */

@interface BBShareEmailContent : BBShareContent

/**
 * 接收人
 */
@property (nonatomic, strong) NSArray *toRecipients;

/**
 * 抄送人
 */
@property (nonatomic, strong) NSArray *ccRecipients;

/**
 * 密送人
 */
@property (nonatomic, strong) NSArray *bccRecipients;

/**
 * 文本内容
 */
@property (nonatomic, copy) NSString *emailContent;

/**
 * 图片
 */
@property (nonatomic, strong) id emailImage;

/**
 * 文件（NSData）
 */
@property (nonatomic, strong) NSData *emailSendData;

/**
 * 文件格式
 */
@property (nonatomic, copy) NSString *fileType;

/**
 * 文件名,(例如图片 imageName.png, 文件名后要跟文件后缀名，否则没法识别，导致类似图片不显示的问题)
 */
@property (nonatomic, copy) NSString *fileName;

@end




#pragma mark - SmsContent
/*
 *  分享消息中的短信分享对象
 */
@interface BBShareSmsContent : BBShareContent

/**
 * 接收人
 */
@property (nonatomic, strong) NSArray *recipients;

/**
 * 文本内容
 */
@property (nonatomic, copy) NSString *smsContent;

/**
 * 图片
 */
@property (nonatomic, strong) id smsImage;

/**
 * 文件数据（NSData）
 * 必填
 */
@property (nonatomic, strong) NSData *smsSendData;

/**
 * 文件格式
 * 必填，必须指定数据格式，如png图片格式应传入@"png"
 */
@property (nonatomic, copy) NSString *fileType;

/**
 * 文件名,(例如图片 imageName.png, 文件名后要跟文件后缀名，否则没法识别，导致类似图片不显示的问题)
 */
@property (nonatomic, copy) NSString *fileName;

/**
 * 文件地址url
 */
@property (nonatomic, copy) NSString *fileUrl;

@end




#pragma mark - EmotionContent
/**
 *  表情的类
 *  表请的缩略图数据请存放在BBShareEmotionContent中
 *  注意：emotionData和emotionURL成员不能同时为空,若同时出现则取emotionURL
 */
@interface BBShareEmotionContent : BBShareContent

/**
 *  表情数据，如GIF等
 * @note 微信的话大小不能超过10M
 */
@property (nonatomic, strong) NSData *emotionData;

/**
 * @param title 标题
 * @param descr 描述
 * @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 *
 */
+ (BBShareEmotionContent *)shareContentWithTitle:(NSString *)title
                                         descr:(NSString *)descr
                                     thBBImage:(id)thBBImage;

@end




#pragma mark - BBSAppExtendContent
/*! @brief 多媒体消息中包含的App扩展数据对象
 *
 * 第三方程序向微信终端发送包含BBShareExtendContent的多媒体消息，
 * 微信需要处理该消息时，会调用该第三方程序来处理多媒体消息内容。
 * @note url，extInfo和fileData不能同时为空
 * @see BBShareContent
 */
@interface BBShareExtendContent : BBShareContent

/** 若第三方程序不存在，微信终端会打开该url所指的App下载地址
 * @note 长度不能超过10K
 */
@property (nonatomic, retain) NSString *url;
/** 第三方程序自定义简单数据，微信终端会回传给第三方程序处理
 * @note 长度不能超过2K
 */
@property (nonatomic, retain) NSString *extInfo;
/** App文件数据，该数据发送给微信好友，微信好友需要点击后下载数据，微信终端会回传给第三方程序处理
 * @note 大小不能超过10M
 */
@property (nonatomic, retain) NSData   *fileData;

@end




#pragma mark - BBFileContent
/*! @brief 多媒体消息中包含的文件数据对象
 *
 * @see BBShareContent
 */
@interface BBShareFileContent : BBShareContent

/** 文件后缀名
 * @note 长度不超过64字节
 */
@property (nonatomic, retain) NSString  *fileExtension;

/** 文件真实数据内容
 * @note 大小不能超过10M
 */
@property (nonatomic, retain) NSData    *fileData;

@end
