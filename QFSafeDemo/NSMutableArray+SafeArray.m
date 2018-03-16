//
//  NSMutableArray+SafeArray.m
//  QFSafeDemo
//
//  Created by liyiping on 2018/3/15.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "NSMutableArray+SafeArray.h"
#import <objc/message.h>

@implementation NSMutableArray (SafeArray)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method addMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(addObject:));
        Method safeAddMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeAddobject:));
        method_exchangeImplementations(addMethod, safeAddMethod);
        
        Method replaceMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(replaceObjectAtIndex:withObject:));
        Method safeReplaceMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeReplaceMethod:withObject:));
        method_exchangeImplementations(replaceMethod, safeReplaceMethod);
        
        Method objectAtIndexMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method safeObjectAtIndexMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeObjectAtIndex:));
        method_exchangeImplementations(objectAtIndexMethod, safeObjectAtIndexMethod);
        
//        Method objectAtIndexedSubscriptMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:));
//        Method safeObjectAtIndexedSubscriptMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeObjectAtIndexedSubscript:));
//        method_exchangeImplementations(objectAtIndexedSubscriptMethod, safeObjectAtIndexedSubscriptMethod);

        Method insertMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:));
        Method safeInsertMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeInsertObject:atIndex:));
        method_exchangeImplementations(insertMethod, safeInsertMethod);

    });
    
    
}

- (void)safeAddobject:(id)anObject {
    if (anObject != nil) {
        [self safeAddobject:anObject];
    } else {
        NSLog(@"object can not be nil");
    }
}

- (void)safeReplaceMethod:(NSUInteger)index withObject:(id)anObject {

    if (index > self.count) {
        NSLog(@"replaceMethod 下标越界");
    } else {
        if (anObject) {
            [self safeReplaceMethod:index withObject:anObject];
        } else {
            NSLog(@"safeReplaceMethod object is nil");
        }
    }
    
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index > self.count) {
        NSLog(@"objectAtIndex 下标越界");
        return nil;
    } else {
        return [self safeObjectAtIndex:index];
    }
}

- (id)safeObjectAtIndexedSubscript:(NSUInteger)idx {
    if (idx > self.count) {
        NSLog(@"objectAtIndexedSubscript 下标越界");
        return nil;
    } else {
        return [self safeObjectAtIndexedSubscript:idx];
    }
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > self.count) {
        NSLog(@"insertObject 下标越界");
    } else {
        if (anObject) {
            [self safeInsertObject:anObject atIndex:index];
        } else {
            NSLog(@"safeInsertObject object is nil");
        }
    }
}

@end
