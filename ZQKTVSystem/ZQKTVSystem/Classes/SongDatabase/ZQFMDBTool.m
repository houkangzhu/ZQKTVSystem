//
//  ZQFMDBTool.m
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

#import "ZQFMDBTool.h"
#import "FMDatabase.h"
#import "ZQFMDBManager.h"
@implementation ZQFMDBTool

+ (BOOL)database:(FMDatabase *)fmdb execUpdate:(NSString *)sqlStr {
    if (stringIsEmpty(sqlStr)) {
        return NO;
    }
    [fmdb open];
    fmdb.shouldCacheStatements = YES;
    BOOL result = [fmdb executeUpdate:sqlStr];
    [fmdb close];
    return result;
}

+ (NSMutableArray *)database:(FMDatabase *)fmdb
                   execQurey:(NSString *)sqlStr
                  modelClass:(Class)ModelCls{
    if (stringIsEmpty(sqlStr)) {
        return nil;
    }
    [fmdb open];
    fmdb.shouldCacheStatements = YES;
    FMResultSet *result = [fmdb executeQuery:sqlStr];
    NSMutableArray *resualtArr = [NSMutableArray array];
    
    int columnCount = -1;
    while (result.next) {
        if (columnCount == -1) {
            columnCount = [result columnCount];
            
        }
        
        id model = [ModelCls new];
        
        for (int i = 0; i<columnCount; i++) {
            [model setValue:[result objectForColumnIndex:i] forKey:[result columnNameForIndex:i]];
        }
        
        [resualtArr addObject:model];
    }
    
    [fmdb close];
    return resualtArr;
}

@end

@implementation ZQFMDBTool (UserOperate)

+ (BOOL)createUserTabel {
    FMDatabase *userFmdb = [ZQFMDBManager sharedZQFMDBManager].userFmdb;
    return [self database:userFmdb execUpdate:[ZQUserModel getCreateTableSQL]];
}

+ (BOOL)insertUserToDatabase:(ZQUserModel *)user {
    FMDatabase *userFmdb = [ZQFMDBManager sharedZQFMDBManager].userFmdb;
    return [self database:userFmdb execUpdate:[user getInsertSQL]];
}

+ (ZQUserModel *)qureyUserWithUserName:(NSString *)userName {
    FMDatabase *userFmdb = [ZQFMDBManager sharedZQFMDBManager].userFmdb;
    NSMutableArray *resArr = [self database:userFmdb execQurey:[ZQUserModel getQureyByUserNameSql:userName] modelClass:[ZQUserModel class]];
    if (resArr.count == 0 || !resArr) {
        return nil;
    }
    return [resArr firstObject];
}
@end