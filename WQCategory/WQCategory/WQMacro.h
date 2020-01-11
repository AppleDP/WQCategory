//
//  WQMacro.h
//  WQCategory
//
//  Created by iOS on 2019/5/6.
//  Copyright © 2019 iOS. All rights reserved.
//

#ifndef WQMacro_h
#define WQMacro_h

/** 单例宏定义 **/
#define kWQSingleH() + (instancetype)shareInstance;

#if __has_feature(objc_arc)
#define kWQSingleM() \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken,^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shareInstance { \
return [[self alloc] init]; \
} \
\
- (id)copyWithZone:(NSZone *)zone { \
return _instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
}
#else
#define kSingleM() \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shareInstance { \
return [[self alloc]init]; \
} \
\
- (id)copyWithZone:(NSZone *)zone { \
return _instance; \
} \
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
} \
-(oneway void)release { \
} \
\
-(instancetype)retain { \
return _instance; \
} \
\
-(NSUInteger)retainCount { \
return MAXFLOAT; \
}
#endif

// 将 self 转为弱引用
#define WS(wself) __weak __typeof(&*self)wself = self
// 将 wself 转为强引用
#define SS(sself, wself) __strong __typeof(&*wself)sself = wself

/**
 * 是否存在安全区（iPhoneX 后添加安全区概念）
 */
NS_INLINE BOOL wq_hasSafeArea() {
    BOOL safeArea = NO;
    if (@available(iOS 11.0, *)) {
        safeArea = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;
    };
    return safeArea;
}

/**
 * 主线程执行 block
 */
NS_INLINE void wq_excuteOnMain(_Nullable dispatch_block_t block) {
    if ([NSThread isMainThread]) {
        block();
    }else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/**
 * 根据 Key 生成国际化语言
 *
 * @param key 国际化字符串标识
 * @param native 国际化字符串文件名称(xxx.strings)
 */
NS_INLINE NSString* _Nullable cx_location(NSString * _Nonnull key, NSString * _Nonnull native) {
    NSArray *appLans = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *lan = [appLans objectAtIndex:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:lan ofType:@"lproj"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return NSLocalizedStringFromTableInBundle(key, native, bundle, nil);
}
#endif /* WQMacro_h */
