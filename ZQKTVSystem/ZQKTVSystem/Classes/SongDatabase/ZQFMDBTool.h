//
//  ZQFMDBTool.h
//  ZQKTVSystem
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
//  Created by 侯康柱 on 16/4/22.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZQUserModel;
@class FMDatabase;
@interface ZQFMDBTool : NSObject

+ (BOOL)database:(FMDatabase *)fmdb execUpdate:(NSString *)sqlStr;
+ (NSMutableArray *)database:(FMDatabase *)fmdb
                   execQurey:(NSString *)sqlStr
                  modelClass:(Class)ModelCls;
@end

@interface ZQFMDBTool (UserOperate)

+ (BOOL)createUserTabel ;

+ (BOOL)insertUserToDatabase:(ZQUserModel *)user;

+ (ZQUserModel *)qureyUserWithUserName:(NSString *)userName;
@end
