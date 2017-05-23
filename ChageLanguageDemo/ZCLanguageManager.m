//
//  ZCLanguageManager.m
//  aaasdadad
//
//  Created by Zeus on 2017/5/19.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "ZCLanguageManager.h"


#define KLanguageKey  @"languageKey"


@interface ZCLanguageManager ()

@property(nonatomic, strong)NSBundle *bundle;

@property(nonatomic, copy)NSString *language;

@end


@implementation ZCLanguageManager


// 单例
+ (id)shareInstance
{
    static ZCLanguageManager *ZCManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ZCManager = [[ZCLanguageManager alloc]init];
    });
    return ZCManager;
}


// 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *tmpString = [[NSUserDefaults standardUserDefaults]valueForKey:KLanguageKey];
        // 默认中文
        if (!tmpString) {
            tmpString = @"zh-Hans"; //中文
        }
        else
        {
            tmpString = @"en"; // 英文
        }
        self.language = tmpString;
        // 获取路径
        NSString *path = [[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
       
    }
    return self;
}



// 返回表中key值对应的语言名
- (NSString *)getLanguageWithKey:(NSString *)key table:(NSString *)tableName
{
    if (self.bundle) {
        return NSLocalizedStringFromTableInBundle(key, tableName, self.bundle, @"");
    }
    return NSLocalizedStringFromTable(key, tableName, @"");
}

// 切换当前的语言
- (void)changeNowLanguage
{
    if ([self.language isEqualToString:@"en"]) {
        [self setNewLanguage:@"zh-Hans"];
    }
    else
    {
        [self setNewLanguage:@"en"];
    }
    
    
}


// 设置新语言
- (void)setNewLanguage:(NSString *)language
{
    if ([language isEqualToString:self.language]) {
        return;
    }
    
    if ([language isEqualToString:@"en"] || [language isEqualToString:@"zh-Hans"]) {
        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    self.language = language;
    [[NSUserDefaults standardUserDefaults]setValue:language forKey:KLanguageKey];
}




@end
