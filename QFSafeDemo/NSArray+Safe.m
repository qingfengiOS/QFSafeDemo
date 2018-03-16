//
//  NSArray+Safe.m
//  QFSafeDemo
//
//  Created by iosyf-02 on 2018/3/16.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "NSArray+Safe.h"
#import <objc/message.h>

@implementation NSArray (Safe)

+ (void)load {
    Method objectAtIndexMethod = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(objectAtIndex:));
    Method safeObjectAtIndexMethod = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(safeObjectAtIndex:));
    method_exchangeImplementations(objectAtIndexMethod, safeObjectAtIndexMethod);
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index > self.count) {
        NSLog(@"objectAtIndex 下标越界");
        return nil;
    } else {
        return [self safeObjectAtIndex:index];
    }
}

@end
