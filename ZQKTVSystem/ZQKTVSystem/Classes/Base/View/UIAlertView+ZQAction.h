//
//  UIAlertView+ZQAction.h
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZQAction)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView(ZQAction)<UIAlertViewDelegate>

- (void)setButttonAction:(ZQAction)action;

- (ZQAction)butttonAction;

@end
