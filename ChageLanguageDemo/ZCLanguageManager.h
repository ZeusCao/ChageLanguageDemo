//
//  ZCLanguageManager.h
//  aaasdadad
//
//  Created by Zeus on 2017/5/19.
//  Copyright © 2017年 Zeus. All rights reserved.
//


#import <Foundation/Foundation.h>




#define KZCLanguageManager [ZCLanguageManager shareInstance]

#define KGetTextFromKey(key,tab)  [KZCLanguageManager getLanguageWithKey:key table:tab]

@interface ZCLanguageManager : NSObject

// 单例
+ (id)shareInstance;

// 返回表中key值对应的语言名
- (NSString *)getLanguageWithKey:(NSString *)key table:(NSString *)tableName;

// 切换当前的语言
- (void)changeNowLanguage;

// 设置新语言
- (void)setNewLanguage:(NSString *)language;



@end
