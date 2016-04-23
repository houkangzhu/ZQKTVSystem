//
//  UIAlertView+ZQAction.m
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "UIAlertView+ZQAction.h"
#include <objc/runtime.h>
@implementation UIAlertView (ZQAction)

static const char associatedKey;
- (void)setButttonAction:(ZQAction)action {
    objc_setAssociatedObject(self, &associatedKey, action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}

- (ZQAction)butttonAction {
    ZQAction action = objc_getAssociatedObject(self, &associatedKey);
    return action;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ZQAction action = [alertView butttonAction];
    if (action) {
        action(alertView, buttonIndex);
    }
}

@end
