//
//  ZQUserModel.h
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
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQBaseDBModel.h"

typedef NS_ENUM(NSUInteger, ZQUserType) {
    ///普通用户--听歌
    ZQUserTypeCommon    = 0,
    ///管理员---配置数据
    ZQUserTypeAdmin     = 1<<1,
    ///最大权限者---可以用来管理用户
    ZQUserTypeBoss      = 1<<2,
    ///未知类型用户
    ZQUserTypeUnknown   = 1<<3,
};

@interface ZQUserModel : ZQBaseDBModel

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *passWord;
//@property (nonatomic, strong) NSString *age;
//@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) ZQUserType userType;

+ (NSString *)getCreateTableSQL;

- (NSString *)getInsertSQL;

+ (NSString *)getQureyByUserNameSql:(NSString *)userName;
@end
