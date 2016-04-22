//
//  ZQUserModel.m
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

#import "ZQUserModel.h"
#include <objc/runtime.h>
@implementation ZQUserModel

+ (void)initialize {
//    [super initialize];
    BOOL createOK = [ZQFMDBTool createUserTabel];
    NSLog(@"创建用户表---%d-", createOK);
}



+ (NSString *)getCreateTableSQL {
    
    NSString *createTableSql = @"CREATE TABLE  IF NOT EXISTS 'UserModels' ('userID' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'userName' CHAR(40) NOT NULL UNIQUE,'passWord' CHAR(40) NOT NULL,'userType' INTEGER(8) NOT NULL );";
    
    return createTableSql;
}

- (NSString *)getInsertSQL {
    NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO 'UserModels' ('userName', 'passWord', 'userType') VALUES ('%@', '%@', '%ld');", _userName, _passWord, _userType];
    return insertSql;
}

+ (NSString *)getQureyByUserNameSql:(NSString *)userName {
    NSString *qureySql = [NSString stringWithFormat:@"SELECT * FROM 'UserModels' WHERE userName = '%@'", userName];
    return qureySql;
}

@end
