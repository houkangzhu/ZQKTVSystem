//
//  ZQAccount.h
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

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZQAccountType) {
    ZQAccountTypeUser,
    ZQAccountTypeAdmin,
};

@interface ZQAccount : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *md5Psd;

@property (nonatomic, assign) ZQAccountType accountType;


@end
