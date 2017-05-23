//
//  BBSocialCommon.m
//  BBShareSDK
//
//  Created by Dongjw on 17/5/15.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBSocialCommon.h"

@implementation BBSocialCommon

#pragma mark - image
/**
 * 缩放图片
 *
 * @param img  图片
 * @param size 要缩放的大小
 *
 * @return 缩放后的图片
 */
+ (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

/**
 * 缩放图片数据
 *
 * @param imgData 图片数据
 * @param size    缩放目标大小
 *
 * @return 缩放后的图片数据
 */
+ (NSData *)scaleToSizeWithImageData:(NSData *)imgData size:(CGSize)size {
    
    UIImage *image = [UIImage imageWithData:imgData];
    UIImage *resultImage = [self scaleImage:image toSize:size];
    
    return UIImagePNGRepresentation(resultImage);
}

/**
 获取当前控制器

 @return 当前控制器
 */
+ (UIViewController *)getCurrentViewController {
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    
    id nextResponder = [frontView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    }else {
        result = window.rootViewController;
    }
    
    if (!result) {
        UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *topVC = appRootVC;
        if (topVC.presentedViewController) {
            topVC = topVC.presentedViewController;
        }
        
        return topVC;
    }
    return result;
}

/**
 从宝宝巴士分享平台转换为友盟分享平台

 @param bbShareType 宝宝巴士平台类型
 @return 友盟平台类型
 */
+ (UMSocialPlatformType )umSocialTypeWithBBShareType:(BBSocialPlatformType )bbShareType {
    
    UMSocialPlatformType umSocialType;

    
    switch (bbShareType) {
            
        case BBSocialPlatformType_UnKnown:
            
            umSocialType = UMSocialPlatformType_Sina;
            break;
            //预定义的平台
        case BBSocialPlatformType_Predefine_Begin:
            
            umSocialType = UMSocialPlatformType_Predefine_Begin;
            break;
        case BBSocialPlatformType_Sina:
            
            umSocialType = UMSocialPlatformType_Sina;
            break;
        case BBSocialPlatformType_WechatSession:
            
            umSocialType = UMSocialPlatformType_WechatSession;
            break;
        case BBSocialPlatformType_WechatTimeLine:
            
            umSocialType = UMSocialPlatformType_WechatTimeLine;
            break;
        case BBSocialPlatformType_WechatFavorite:
            
            umSocialType = UMSocialPlatformType_WechatFavorite;
            break;
        case BBSocialPlatformType_QQ:
            
            umSocialType = UMSocialPlatformType_QQ;
            break;
        case BBSocialPlatformType_Qzone:
            
            umSocialType = UMSocialPlatformType_Qzone;
            break;
        case BBSocialPlatformType_TencentWb:
            
            umSocialType = UMSocialPlatformType_TencentWb;
            break;
        case BBSocialPlatformType_AlipaySession:
            
            umSocialType = UMSocialPlatformType_AlipaySession;
            break;
        case BBSocialPlatformType_YixinSession:
            
            umSocialType = UMSocialPlatformType_YixinSession;
            break;
        case BBSocialPlatformType_YixinTimeLine:
            
            umSocialType = UMSocialPlatformType_YixinTimeLine;
            break;
        case BBSocialPlatformType_YixinFavorite:
            
            umSocialType = UMSocialPlatformType_YixinFavorite;
            break;
        case BBSocialPlatformType_LaiWangSession:
            
            umSocialType = UMSocialPlatformType_LaiWangSession;
            break;
        case BBSocialPlatformType_LaiWangTimeLine:
            
            umSocialType = UMSocialPlatformType_LaiWangTimeLine;
            break;
        case BBSocialPlatformType_Sms:
            
            umSocialType = UMSocialPlatformType_Sms;
            break;
        case BBSocialPlatformType_Email:
            
            umSocialType = UMSocialPlatformType_Email;
            break;
        case BBSocialPlatformType_Renren:
            
            umSocialType = UMSocialPlatformType_Renren;
            break;
        case BBSocialPlatformType_Facebook:
            
            umSocialType = UMSocialPlatformType_Facebook;
            break;
        case BBSocialPlatformType_Twitter:
            
            umSocialType = UMSocialPlatformType_Twitter;
            break;
        case BBSocialPlatformType_Douban:
            
            umSocialType = UMSocialPlatformType_Douban;
            break;
        case BBSocialPlatformType_KakaoTalk:
            
            umSocialType = UMSocialPlatformType_KakaoTalk;
            break;
        case BBSocialPlatformType_Pinterest:
            
            umSocialType = UMSocialPlatformType_Pinterest;
            break;
        case BBSocialPlatformType_Line:
            
            umSocialType = UMSocialPlatformType_Line;
            break;
        case BBSocialPlatformType_Linkedin:
            
            umSocialType = UMSocialPlatformType_Linkedin;
            break;
        case BBSocialPlatformType_Flickr:
            
            umSocialType = UMSocialPlatformType_Flickr;
            break;
        case BBSocialPlatformType_Tumblr:
            
            umSocialType = UMSocialPlatformType_Tumblr;
            break;
        case BBSocialPlatformType_Instagram:
            
            umSocialType = UMSocialPlatformType_Instagram;
            break;
        case BBSocialPlatformType_Whatsapp:
            
            umSocialType = UMSocialPlatformType_Whatsapp;
            break;
        case BBSocialPlatformType_DingDing:
            
            umSocialType = UMSocialPlatformType_DingDing;
            break;
        case BBSocialPlatformType_YouDaoNote:
            
            umSocialType = UMSocialPlatformType_YouDaoNote;
            break;
        case BBSocialPlatformType_EverNote:
            
            umSocialType = UMSocialPlatformType_EverNote;
            break;
        case BBSocialPlatformType_GooglePlus:
            
            umSocialType = UMSocialPlatformType_GooglePlus;
            break;
        case BBSocialPlatformType_Pocket:
            
            umSocialType = UMSocialPlatformType_Pocket;
            break;
        case BBSocialPlatformType_DropBox:
            
            umSocialType = UMSocialPlatformType_DropBox;
            break;
        case BBSocialPlatformType_VKontakte:
            
            umSocialType = UMSocialPlatformType_VKontakte;
            break;
        case BBSocialPlatformType_FaceBookMessenger:
            
            umSocialType = UMSocialPlatformType_FaceBookMessenger;
            break;
        case BBSocialPlatformType_Predefine_end:
            
            umSocialType = UMSocialPlatformType_Predefine_end;
            break;
            //用户自定义的平台
        case BBSocialPlatformType_UserDefine_Begin:
            
            umSocialType = UMSocialPlatformType_UserDefine_Begin;
            break;
        case BBSocialPlatformType_UserDefine_End:
            
            umSocialType = UMSocialPlatformType_UserDefine_End;
            break;
        default:
            break;
    }
    return umSocialType;
}

@end
