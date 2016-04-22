//
//  ZQLineView.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQLineView.h"

#define kDefualt_Width      1.0f
#define kDefualt_Color      [UIColor grayColor]

@implementation ZQLineView
{
    UIView *_lineView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self setLineView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setLineView];
    }
    return self;
}

- (void)setLineView {
    [self layoutSubviews];
    [self layoutIfNeeded];
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), kDefualt_Width)];
    _lineView.backgroundColor = kDefualt_Color;
    [self addSubview:_lineView];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    CGRect lineRect = _lineView.frame;
    lineRect.size.height = lineWidth;
    _lineView.frame = lineRect;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineView.backgroundColor = lineColor;
    _lineColor = lineColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
