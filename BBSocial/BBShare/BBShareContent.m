//
//  BBShareContent.m
//  BBShareSDK
//
//  Created by Dongjw on 17/5/14.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <objc/message.h>

#import "BBShareContent.h"

@implementation BBShareContent

/**
 宝宝巴士ShareContent类型转换为友盟UMSocialMessageObject（根）类型中的shareObject
 
 @param content 需要被转换的BBShareContent或其子类
 @return UMSocialMessageObject *
 */
+ (UMSocialMessageObject *)umSocialMessageObjectWithBBShareContent:(BBShareContent *)content {
    
    //创建友盟分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    id object;
    id (*objc_msgSendTyped)(id x, SEL _cmd) = (id (*)(id x, SEL _cmd))objc_msgSend;
    if ([content isKindOfClass:[BBShareImageContent class]]) {
        
        object = [UMShareImageObject shareObjectWithTitle:content.title
                                                    descr:content.descr
                                                thumImage:content.thumbImage];

        
        UIImage *imgStr = objc_msgSendTyped(content,@selector(shareImage));
        [object setShareImage:imgStr];
        
    }else if ([content isKindOfClass:[BBShareMusicContent class]]) {
         
    }else if ([content isKindOfClass:[BBShareVideoContent class]]) {
        
    }else if ([content isKindOfClass:[BBShareWebpageContent class]]) {
         
        object = [UMShareWebpageObject shareObjectWithTitle:content.title
                                                    descr:content.descr
                                                thumImage:content.thumbImage];
        
        NSString *webpageUrlStr = objc_msgSendTyped(content,@selector(webpageUrl));
        [object setWebpageUrl:webpageUrlStr];
        
    }else if ([content isKindOfClass:[BBShareEmailContent class]]) {
         
    }else if ([content isKindOfClass:[BBShareSmsContent class]]) {
         
    }
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = object;
    messageObject.text = content.descr;
    messageObject.moreInfo = content.moreInfo;
    
    return messageObject;
}

@end




@implementation BBShareImageContent

/**
 返回一个拥有图片属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url
 @return BBShareImageContent
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareImageContent *content = [[BBShareImageContent alloc] init];
    content.descr = descr;
    content.shareImage = thBBImage;
    
    return content;
}

@end




@implementation BBShareMusicContent

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareWebpageContent *content = [[BBShareWebpageContent alloc] init];
    content.title = title;
    content.descr = descr;
    content.thumbImage = thBBImage;
    return content;
}

@end




@implementation BBShareVideoContent

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareWebpageContent *content = [[BBShareWebpageContent alloc] init];
    content.title = title;
    content.descr = descr;
    content.thumbImage = thBBImage;
    return content;
}

@end




@implementation BBShareWebpageContent

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareWebpageContent *content = [[BBShareWebpageContent alloc] init];
    content.title = title;
    content.descr = descr;
    content.thumbImage = thBBImage;
    return content;
}

@end




@implementation BBShareEmailContent

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareWebpageContent *content = [[BBShareWebpageContent alloc] init];
    content.title = title;
    content.descr = descr;
    content.thumbImage = thBBImage;
    return content;
}

@end




@implementation BBShareSmsContent

/**
 返回一个拥有网页属性的分享体
 
 @param title 标题
 @param descr 描述
 @param thBBImage 缩略图（UIImage或者NSData类型，或者image_url）
 @return BBShareWebpageContent *
 */
+ (id)shareContentWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thBBImage:(id)thBBImage {
    
    BBShareWebpageContent *content = [[BBShareWebpageContent alloc] init];
    content.title = title;
    content.descr = descr;
    content.thumbImage = thBBImage;
    return content;
}

@end



