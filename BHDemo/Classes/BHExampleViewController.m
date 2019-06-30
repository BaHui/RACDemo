//
//  BHExampleViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/18.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "BHExampleViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface BHExampleViewController ()

@end

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";


@implementation BHExampleViewController

+ (instancetype)create {
  UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
  return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([BHExampleViewController class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self traverseArray];
  [self traverseArrayHasCompletedCallBack];

  [self traverseDictionary];
  [self traverseDictionaryHasCompletedCallBack];
}

#pragma mark - RAC 遍历数组

// RAC数组遍历(无遍历完成回调)
- (void)traverseArray {
  NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"11", @"22", @"33", nil];

  [array1.rac_sequence.signal subscribeNext:^(NSString *string) {
    NSLog(@"currentThread: %@", [NSThread currentThread]);
    NSLog(@"string: %@", string);
  }];
}

// RAC数组遍历(含遍历完成回调)
- (void)traverseArrayHasCompletedCallBack {
  NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"66", @"77", @"88", nil];

  [array2.rac_sequence.signal subscribeNext:^(NSString *string) {
    NSLog(@"currentThread: %@", [NSThread currentThread]);
    NSLog(@"string: %@", string);
  } completed:^{
    NSLog(@"completed currentThread: %@", [NSThread currentThread]);
    NSLog(@"array2_completed !!!");
  }];
}

#pragma mark - RAC 遍历字典

- (void)traverseDictionary {
  NSDictionary *dictionary1 = @{@"key0" : @"00",
                                @"key1" : @"11",
                                @"key2" : @"22"};

  [dictionary1.rac_sequence.signal subscribeNext:^(RACTuple *x) {
    RACTupleUnpack(NSString *key, NSString *value) = x;
    NSLog(@"currentThread: %@", [NSThread currentThread]);
    NSLog(@"key_value: %@-%@", key, value);
  }];
}

- (void)traverseDictionaryHasCompletedCallBack {
  NSDictionary *dictionary2 = @{@"key4" : @"44",
                                @"key5" : @"55",
                                @"key6" : @"66"};

  [dictionary2.rac_sequence.signal subscribeNext:^(RACTuple *x) {
    RACTupleUnpack(NSString *key, NSString *value) = x;
    NSLog(@"currentThread: %@", [NSThread currentThread]);
    NSLog(@"key_value: %@-%@", key, value);
  } completed:^{
    NSLog(@"currentThread: %@", [NSThread currentThread]);
    NSLog(@"dictionary2_completed");
  }];
}

@end
