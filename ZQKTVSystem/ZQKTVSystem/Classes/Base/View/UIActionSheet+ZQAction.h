//
//  UIActionSheet+ZQAction.h
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZQASAction)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (ZQAction)<UIActionSheetDelegate>

- (void)setButttonAction:(ZQASAction)action;

- (ZQASAction)butttonAction;

@end
