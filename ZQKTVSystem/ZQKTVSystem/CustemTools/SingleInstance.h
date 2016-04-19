//
//  SingleInstance.h
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/2.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#ifndef SingleInstance_h
#define SingleInstance_h

//一个单例类的宏定义

#define SingleInterface(Class)  + (instancetype)shared##Class;

#define SingleImplementation(Class)   static Class *singleton = nil;\
\
+ (instancetype)shared##Class{\
\
static dispatch_once_t onceToken;\
\
dispatch_once(&onceToken, ^{\
\
singleton = [[Class alloc]init];\
\
});\
\
return singleton;\
}\
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
    @synchronized(self) \
    { \
        if (singleton == nil) \
        { \
            singleton = [super allocWithZone:zone]; \
            return singleton; \
        } \
    } \
    \
    return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
    return self; \
}

#endif /* SingleInstance_h */
