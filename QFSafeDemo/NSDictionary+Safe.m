//
//  NSDictionary+Safe.m
//  QFSafeDemo
//
//  Created by iosyf-02 on 2018/3/16.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import <objc/message.h>

@implementation NSDictionary (Safe)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method objectForKeyMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(objectForKey:));
        Method safeObjectForKeyMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(safeObjectForKey:));
        method_exchangeImplementations(objectForKeyMethod, safeObjectForKeyMethod);
        
    });
}

- (id)safeObjectForKey:(id)aKey {
    id value = [self safeObjectForKey:aKey];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

@end
