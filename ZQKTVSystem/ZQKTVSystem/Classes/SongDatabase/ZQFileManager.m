//
//  ZQFileManager.m
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

#import "ZQFileManager.h"

@implementation ZQFileManager

+ (NSString *)getDocumentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)getDocumentPathWithFolderName:(NSString *)folder {
    NSString *docPath = [self getDocumentPath];
    return [docPath stringByAppendingPathComponent:folder];
}

+ (BOOL)createFilePath:(NSString *)filePath isfile:(BOOL)isfile{
    NSFileManager *fm = [NSFileManager defaultManager];
    if (!isfile) {
       return [fm createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [fm createFileAtPath:filePath contents:nil attributes:nil];
}
@end
