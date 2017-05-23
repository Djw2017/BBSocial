//
//  BBShareMenuItemProtocol.h
//  BBShare
//
//  Created by Dongjw on 17/5/18.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BBSocialPlatformConfig.h"

@protocol BBShareMenuItemProtocol <NSObject>

/**
 * 标题
 *
 * @return 标题
 */
- (NSString *)title;

/**
 * 图标
 *
 * @return 图标
 */
- (NSString *)iconStr;

@end
