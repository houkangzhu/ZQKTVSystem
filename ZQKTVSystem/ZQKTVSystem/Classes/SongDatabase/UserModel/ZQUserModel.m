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
#import "ZQFileManager.h"
#include <objc/runtime.h>
@implementation ZQUserModel

+ (void)initialize {
//    [super initialize];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BOOL createOK = [ZQFMDBTool createUserTabel];
        NSLog(@"创建用户表---%d-", createOK);
    });
}

- (NSString *)HeadPath {
    return [ZQFileManager getHeaderPathWithImgName:_userName];
}

- (NSString *)getUserTypeDes {
    switch (_userType) {
        case ZQUserTypeCommon:
            return @"普通用户";
            break;
            
        case ZQUserTypeBoss:
            return @"大管理员";
            break;
        case ZQUserTypeAdmin:
            return @"小管理员";
            break;
        default:
            return @"未知类型用户";
            break;
    }
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
