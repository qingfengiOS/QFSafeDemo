//
//  ViewController.m
//  QFSafeDemo
//
//  Created by liyiping on 2018/3/15.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testArray];
    
    [self testDictionary];
}


- (void)testArray {
    NSMutableArray *testArray = [NSMutableArray arrayWithObject:@"1"];
    [testArray addObject:nil];
    
    [testArray replaceObjectAtIndex:0 withObject:nil];
    
    [testArray replaceObjectAtIndex:2 withObject:@"1"];
    
    id a = [testArray objectAtIndex:5];
    
    id b = testArray[5];
    
    [testArray insertObject:nil atIndex:0];
    
    [testArray insertObject:@"2" atIndex:10];
}


- (void)testDictionary {
    NSMutableDictionary *testDic = [NSMutableDictionary dictionary];
    
    id a = [testDic objectForKey:@"key"];
    id b = testDic[@"key2"];
    NSLog(@"%@-%@",a,b);
    [testDic setObject:a forKey:@"key3"];
    
}

@end
