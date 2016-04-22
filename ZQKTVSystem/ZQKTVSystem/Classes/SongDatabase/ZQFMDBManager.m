//
//  ZQFMDBManager.m
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

#import "ZQFMDBManager.h"
#import "FMDB.h"
#import "ZQFileManager.h"
@implementation ZQFMDBManager
{
    FMDatabase *_systemFmdb;
    
    FMDatabase *_userFmdb;
}

SingleImplementation(ZQFMDBManager)

- (instancetype)init {
    if (self = [super init]) {
        _systemFmdb = [FMDatabase databaseWithPath:[ZQFileManager getSystemSongDBPath]];
    }
    return self;
}

- (FMDatabase *)systemFmdb {
    return _systemFmdb;
}

- (FMDatabase *)userFmdb {
    if (!_userFmdb) {
        _userFmdb =  [FMDatabase databaseWithPath:[ZQFileManager getUserDatabasePath]];
    }
    return _userFmdb;
}
@end
