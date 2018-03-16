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

    NSMutableArray *testArray = [NSMutableArray arrayWithObject:@"1"];
    [testArray addObject:nil];
    
    [testArray replaceObjectAtIndex:0 withObject:nil];
    
    [testArray replaceObjectAtIndex:2 withObject:@"1"];

    id a = [testArray objectAtIndex:5];
    
    id b = testArray[5];
    
    [testArray insertObject:nil atIndex:0];
    
    [testArray insertObject:@"2" atIndex:10];

}





@end
