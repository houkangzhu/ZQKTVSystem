//
//  ZQAlertView.m
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ZQAlertView.h"

#define kDefaultWidth       160.0f
#define kDefaultHeight      40.0f

@interface ZQAlertView ()

@property (nonatomic, strong) UILabel *infoLabel;
@end

@implementation ZQAlertView

SingleImplementation(ZQAlertView)

- (instancetype)init {
    if (self = [super init]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.frame = CGRectMake(0, 0, kDefaultWidth, kDefaultHeight);
    self.backgroundColor = [UIColor blackColor];
//    self.
    [ZQExtraUnit viewSetCorners:self cornersSize:10];
    
    _infoLabel = [ZQExtraUnit createLabelWithText:@"  " fontSize:15.0 frame:self.bounds textColor:kWhiteColor textAlignment:NSTextAlignmentCenter];
    _infoLabel.numberOfLines = 0;
    [self addSubview:_infoLabel];
    self.alpha = 0;
}


- (void)layoutWithText:(NSString *)title {

    
    CGFloat textWidth = [ZQExtraUnit textGetWidth:title font:self.infoLabel.font maxHeight:kDefaultHeight-20];
    
    CGRect newFrame = CGRectMake(0, 0, kDefaultWidth, kDefaultHeight);
    
    if (textWidth < kScrenWidth - 100) {
        
        if (textWidth > kDefaultWidth-20) {
            
            newFrame.size.width = textWidth + 20;
            
        }
    }
    else {
        CGFloat textHeight = [ZQExtraUnit textGetHeight:title font:self.infoLabel.font maxWidth:kScrenWidth - 100];
        newFrame.size.width = kScrenWidth - 80;
        newFrame.size.height = textHeight + 20;
        

    }
    self.frame = newFrame;
    self.center = [ZQExtraUnit getKeyWindow].center;
    self.infoLabel.frame = CGRectMake(10, 10, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame)-20);
}


- (void)showAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.8;
    } completion:^(BOOL finished) {
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self hidenAnimation];
            
        });
        
    }];
}

- (void)hidenAnimation {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

+ (void)showTitle:(NSString *)title {
    
    ZQAlertView *alert = [ZQAlertView sharedZQAlertView];
    [[ZQExtraUnit getKeyWindow] addSubview:alert];
    alert.infoLabel.text = title;
    [alert layoutWithText:title];
    
    [alert showAnimation];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation ZQAlertView (Progress)

+ (void)showProgressHUD {
    
    [MBProgressHUD showHUDAddedTo:[ZQExtraUnit getKeyWindow] animated:YES];
}

+ (void)hidenProgressHUD {
    
    [MBProgressHUD hideHUDForView:[ZQExtraUnit getKeyWindow] animated:YES];
}
@end

