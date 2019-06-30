//
//  BHDelegaterViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2019/6/30.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import "BHDelegaterViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "Masonry.h"

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";

@implementation BHDelegaterViewController

+ (instancetype)create {
  UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
  return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addContentView];
}

#pragma mark - Private Methods

- (void)addContentView {
  BHContentView *contentView = [[BHContentView alloc] init];
  [self.view addSubview:contentView];
  [contentView.clickEventSignal subscribeNext:^(id  _Nullable x) {
    NSLog(@"sssssss: %@", x);
  }];

  [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(0);
    make.width.height.mas_equalTo(200.f);
  }];
}

@end
