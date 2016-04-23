//
//  ZQUserInfoView.m
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ZQUserInfoView.h"

@implementation ZQUserInfoView
{
    __weak IBOutlet UIButton *_headerImag;
    __weak IBOutlet UILabel *_userNameLb;
    
    __weak IBOutlet UILabel *_accountTypeLB;
    __weak IBOutlet UIButton *_exitBtn;
}

+ (instancetype)createInfoView {
    return [[[NSBundle mainBundle] loadNibNamed:@"ZQUserInfoView" owner:self options:nil] firstObject];
}


- (void)setUser:(ZQUserModel *)user {
    
    [ZQExtraUnit viewSetCorners:_exitBtn cornersSize:4];
    
    _userNameLb.text = [NSString stringWithFormat:@"用户名: %@", user.userName];
    _accountTypeLB.text = [NSString stringWithFormat:@"账户类型: %@", [user getUserTypeDes]];
    
    UIImage *headImg = [UIImage imageWithContentsOfFile:[user HeadPath]];
    if (headImg) {
        [_headerImag setBackgroundImage:headImg forState:UIControlStateNormal];
    }
}

///更换头像
- (IBAction)headTouchAction:(UIButton *)sender {
    if (self.changeHeadBlock) {
        self.changeHeadBlock(sender);
    }
}
- (IBAction)exitAction:(UIButton *)sender {
    
    if (self.exitAccountBlock) {
        self.exitAccountBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
