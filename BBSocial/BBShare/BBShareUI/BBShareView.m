//
//  BBShareView.m
//  Baby_Recommend
//
//  Created by 刘艳妮 on 17/4/1.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "BBShareView.h"
#import "BBShareButton.h"


@interface BBShareView ()<UIScrollViewDelegate> {

    // 分享项
    NSArray <BBShareMenuItem *> *_shareList;
    // 自定义项
    NSArray <BBOtherMenuItem *> *_otherList;
    
    UIView *_viewBG;
    
    // 自定义界面第一行scrollview
    UIScrollView *_shareScrollView;
    
    UIView *_lineView;
}

@property (nonatomic, strong) BBShareClickShareItemHandler shareItemHandler;
@property (nonatomic, strong) BBShareClickOtherItemHandler otherItemHandler;
@property (nonatomic, strong) BBShareClickCancelHandler cancelHandler;

@end

@implementation BBShareView

- (instancetype)initWithFrame:(CGRect)frame
                withShareList:(NSMutableArray <BBShareMenuItem *> *)shareList
                withOtherList:(NSArray <BBOtherMenuItem *> *)otherList {
    
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_FULL_WIDTH, SCREEN_FULL_HEIGHT)];
    
    if (self) {
        
        _shareList = shareList;
        _otherList = otherList;
        
        self.backgroundColor = COLOR_WIHT_HEX_ALPHA(0x000000, 0);
     
        [self loadViewBG];
        
        //加载点击手势
        [self loadTapGestureRecognizer];

        // 创建ScrollView
        [self loadShareScrollView];
     
        // 第一行分享视图
        [self shareListView];
        
        // 横线
        [self lineView];

        // 第二行自定义视图
        [self loadOtherView];

        // 取消按钮
        [self loadCancelButton];

        
    }
    return self;
}

- (void)loadViewBG {
    _viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_FULL_HEIGHT, SCREEN_FULL_WIDTH, 256)];
    _viewBG.backgroundColor = [UIColor whiteColor];
    [self addSubview:_viewBG];
}

/**
 第一行分享视图
 */
- (void)shareListView {
    
    UIView *viewSnsBG = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 63*_shareList.count+24+9*(_shareList.count-1), 100)];
    [_shareScrollView addSubview:viewSnsBG];
    
    NSMutableArray *arraybtn = [NSMutableArray array];
    for (int i = 0; i < _shareList.count; i++) {
        
        BBShareMenuItem *item = _shareList[i];
        
        BBShareButton *buttonPlatform = [[BBShareButton alloc] init];
        buttonPlatform.tag = 10000 + item.shareType;
        [buttonPlatform addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttonPlatform fillShareDataWithTitle:item.title imageStr:item.iconStr];
        [viewSnsBG addSubview:buttonPlatform];
        [buttonPlatform mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(viewSnsBG).offset(20);
            if (i==0) {
                make.left.equalTo(viewSnsBG).offset(12);
            }else {
                UIButton *lastButton=[arraybtn lastObject];
                make.left.equalTo(lastButton.mas_right).offset(9);
            }
            
            make.size.mas_equalTo(CGSizeMake(63, 80));
            
        }];
        [arraybtn addObject:buttonPlatform];
        
    }
}

/**
 第一行与第二行中的横线
 */
- (void)lineView {
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = COLOR_WIHT_HEX_ALPHA(0xDFE2E4, 1);
    [_viewBG addSubview:_lineView];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_viewBG);
        make.top.equalTo(_viewBG).offset(100);
        make.height.mas_equalTo(IS_RETINA?0.5:1.0);
    }];
}

/**
 第二行其它按钮视图
 */
- (void)loadOtherView {
    
    NSMutableArray *arrayOther = [NSMutableArray array];
    for (int i=0; i<_otherList.count; i++) {
        
        BBOtherMenuItem *item = _otherList[i];
        
        BBShareButton *buttonOther=[[BBShareButton alloc]init];
        buttonOther.tag = 20000 + i;
        [buttonOther addTarget:self action:@selector(otherAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttonOther fillShareDataWithTitle:item.title imageStr:item.iconStr];
        [_viewBG addSubview:buttonOther];
        [buttonOther mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView).offset(20);
            if (i==0) {
                make.left.equalTo(_viewBG).offset(12);
            }else {
                UIButton *lastButton=[arrayOther lastObject];
                make.left.equalTo(lastButton.mas_right).offset(9);
            }
            
            make.size.mas_equalTo(CGSizeMake(63, 80));
            
        }];
        
        [arrayOther addObject:buttonOther];
    }
}

/**
 创建自定义分享界面第一行的ScrollView
 */
- (void)loadShareScrollView {
    
    _shareScrollView = [[UIScrollView alloc]init];
    _shareScrollView.delegate=self;
    _shareScrollView.showsVerticalScrollIndicator = NO;
    _shareScrollView.showsHorizontalScrollIndicator = NO;
    [_viewBG addSubview:_shareScrollView];
    
    [_shareScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_viewBG);
        make.height.mas_equalTo(110);
    }];
    
    _shareScrollView.contentSize=CGSizeMake(63 * _shareList.count+24+9*(_shareList.count-1), 110);
}

/**
 创建点击手势给自身
 */
- (void)loadTapGestureRecognizer {
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onBGTouchAction)];
    [self addGestureRecognizer:tap];
}

/**
 创建取消按钮
 */
- (void)loadCancelButton {
    
    UIButton *buttonCancel=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttonCancel setTitle:@"取消" forState:UIControlStateNormal];
    [buttonCancel setTitleColor:COLOR_WIHT_HEX_ALPHA(0x19B5FE, 1) forState:UIControlStateNormal];
    [buttonCancel addTarget:self action:@selector(onCancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_viewBG addSubview:buttonCancel];
    [buttonCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_viewBG).offset(-15);
        make.centerX.equalTo(_viewBG);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(41);
    }];
    buttonCancel.layer.borderWidth = 1.0;
    buttonCancel.layer.borderColor = COLOR_WIHT_HEX_ALPHA(0x19B5FE, 1).CGColor;
    buttonCancel.layer.cornerRadius = 20;
    buttonCancel.layer.masksToBounds = YES;
}

#pragma mark - 点击事件
- (void)shareAction:(UIButton *)button {
    
    BBSocialPlatformType type = (NSInteger)button.tag-10000;
    if (self.shareItemHandler) {
        self.shareItemHandler(type);
    }
}

- (void)otherAction:(UIButton *)button {
    
    NSInteger index = button.tag-20000;
    if (self.otherItemHandler) {
        self.otherItemHandler(index);
    }
}

-(void)onBGTouchAction {
    
    if (self.cancelHandler) {
        self.cancelHandler();
    }
}

-(void)onCancelButtonClick:(UIButton *)button {
    if (self.cancelHandler) {
        self.cancelHandler();
    }
}


/**
 点击各个item,包含第一行与第二行
 
 @param shareItemHandler 点击第一行分享按钮
 @param otherItemHandler 点击第二行其它按钮
 @param cancelHandler 取消操作
 */
- (void)clickShareItem:(BBShareClickShareItemHandler )shareItemHandler
    withClickOtherItem:(BBShareClickOtherItemHandler )otherItemHandler
        withCickCancel:(BBShareClickCancelHandler )cancelHandler {

    self.shareItemHandler = shareItemHandler;
    self.otherItemHandler = otherItemHandler;
    self.cancelHandler = cancelHandler;
}

#pragma mark - 界面效果
- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = COLOR_WIHT_HEX_ALPHA(0x000000, 0.5);
        _viewBG.frame=CGRectMake(0, SCREEN_FULL_HEIGHT-256, SCREEN_FULL_WIDTH, 256);
    }];
}

- (void)remove {
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = COLOR_WIHT_HEX_ALPHA(0x000000, 0);
        _viewBG.frame=CGRectMake(0, SCREEN_FULL_HEIGHT, SCREEN_FULL_WIDTH, 256);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
