//
//  ZQFileManager.h
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
#define kSystemSongDBName   @"systemSongDatabase.db"

#define kUserDatabaseName   @"userDatabase.db"

@interface ZQFileManager : NSObject

+ (NSString *)getDocumentPath;

+ (NSString *)getDocumentPathWithFolderName:(NSString *)folder;

+ (BOOL)createFilePath:(NSString *)filePath isfile:(BOOL)isfile;
@end

@interface ZQFileManager (DatabaseFile)

+ (NSString *)getSystemSongDBPath;

+ (NSString *)getUserDatabasePath;

@end

@interface ZQFileManager (ImageSource)

+ (NSString *)getHeaderPathWithImgName:(NSString *)imgName;

@end
