//
//  BBShareButton.h
//  BBShare
//
//  Created by Dongjw on 17/5/18.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBShareButton : UIButton

-(void)fillDataWithTopic:(NSString *)topic withImageStr:(NSString *)imageStr;

-(void)fillShareDataWithTitle:(NSString *)title imageStr:(NSString *)imageStr;

@end
