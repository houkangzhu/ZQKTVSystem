//
//  ZQAccountTools.m
//  ZQMusicPlayer
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                   佛祖保佑           永无BUG
//         .............................................
//
//  Created by 侯康柱 on 16/4/2.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQAccountTools.h"
#include <objc/runtime.h>

#define kAccountDidlogin    @"accountDidLogin"

@implementation ZQAccountTools

SingleImplementation(ZQAccountTools)

- (void)loginWithUserName:(NSString *)userName passworld:(NSString *)psw type:(ZQAccountType)accType {
    if (!_currentAccount) {
        _currentAccount = [[ZQAccount alloc] init];
    }
    _currentAccount.userName = userName;
    _currentAccount.md5Psd = psw;
    _currentAccount.accountType = accType;
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAccountDidlogin];
    [self saveAccount];
}

- (void)exitCurrentAccount {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kAccountDidlogin];
    [self enumerateAccountAllPropertyUsingBlock:^(NSString *propertyName) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:propertyName];
    }];
}

- (void)saveAccount {
    [self enumerateAccountAllPropertyUsingBlock:^(NSString *propertyName) {
        id value = [_currentAccount valueForKey:propertyName];
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:propertyName];
    }];
}

- (void) setAccountValue {
    [self enumerateAccountAllPropertyUsingBlock:^(NSString *propertyName) {
        id propertyValue = [[NSUserDefaults standardUserDefaults] valueForKey:propertyName];
        [_currentAccount setValue:propertyValue forKey:propertyName];
    }];
}

- (void)enumerateAccountAllPropertyUsingBlock:(void(^)(NSString *propertyName))block {
    unsigned int propertyCount ;
    objc_property_t *property_list = class_copyPropertyList([ZQAccount class], &propertyCount);
    for (int i=0; i<propertyCount; i++) {
        objc_property_t property = property_list[i];
        const char *property_char = property_getName(property);
        NSString *property_str = [NSString stringWithUTF8String:property_char];
        if (block) {
            block(property_str);
        }
    }
    free(property_list);
}

- (ZQAccount *)CurrentAccount {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kAccountDidlogin]) {
        return nil;
    }
    if (stringIsEmpty(_currentAccount.userName)) {
        [self setAccountValue];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAccountDidlogin];
    }
    return _currentAccount;
}

@end
