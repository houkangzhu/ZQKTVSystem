//
//  UIActionSheet+ZQAction.m
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "UIActionSheet+ZQAction.h"
#include <objc/runtime.h>
@implementation UIActionSheet (ZQAction)

static const char associatedKey;
- (void)setButttonAction:(ZQASAction)action {
    objc_setAssociatedObject(self, &associatedKey, action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}

- (ZQASAction)butttonAction {
    return objc_getAssociatedObject(self, &associatedKey);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.butttonAction) {
        self.butttonAction(self, buttonIndex);
    }
}

@end
