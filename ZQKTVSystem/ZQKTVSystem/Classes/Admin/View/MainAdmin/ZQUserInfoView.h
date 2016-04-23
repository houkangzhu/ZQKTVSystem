//
//  ZQUserInfoView.h
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQUserInfoView : UIView

+ (instancetype)createInfoView ;

@property (nonatomic, strong) ZQUserModel *user;

@property (nonatomic, strong) void (^ changeHeadBlock)(UIButton *sender);
@property (nonatomic, strong) void (^ exitAccountBlock)(void);
@end
