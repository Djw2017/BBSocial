//
//  BBOtherMenuItem.h
//  BBShare
//
//  Created by Dongjw on 17/5/18.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShareMenuItemProtocol.h"

/**
 自定义分享界面中其它按钮
 */
@interface BBOtherMenuItem : NSObject <BBShareMenuItemProtocol>

/**
 * 标题
 */
@property (nonatomic, strong) NSString *title;

/**
 * 自定义图标
 */
@property (nonatomic, copy) NSString *iconStr;

/**
 * 初始化自定义按钮
 *
 * @param title        标题
 * @param iconStr      图标
 *
 * @return 自定义按钮模型
 */
- (id)initWithTitle:(NSString *)title
               icon:(NSString *)iconStr;

@end
