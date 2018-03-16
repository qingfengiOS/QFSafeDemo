//
//  NSMutableDictionary+SafeDictionary.m
//  QFSafeDemo
//
//  Created by iosyf-02 on 2018/3/16.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "NSMutableDictionary+SafeDictionary.h"
#import <objc/message.h>

@implementation NSMutableDictionary (SafeDictionary)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method objectForKeyMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(objectForKey:));
        Method safeObjectForKeyMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(safeObjectForKey:));
        method_exchangeImplementations(objectForKeyMethod, safeObjectForKeyMethod);
        
        Method setObjectMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
        Method safeSetObjectMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(safeSetObject:forKey:));
        method_exchangeImplementations(setObjectMethod, safeSetObjectMethod);
    });
}

- (id)safeObjectForKey:(id)aKey {
    id value = [self safeObjectForKey:aKey];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject) {
        [self safeSetObject:anObject forKey:aKey];
    } else {
        NSLog(@"anObject is nil");
    }
}

@end
