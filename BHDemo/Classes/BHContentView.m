//
//  BHContentView.m
//  BHDemo
//
//  Created by QiaoBaHui on 2019/6/30.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import "BHContentView.h"
#import "Masonry.h"

@implementation BHContentView

- (instancetype)init {
  self = [super init];
  if (self) {
    self.backgroundColor = [UIColor blackColor];
    [self configureButton];
  }

  return self;
}

- (void)configureButton {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.backgroundColor = [UIColor grayColor];
  [button setTitle:@"点击" forState:UIControlStateNormal];
  [self addSubview:button];

  self.clickEventSignal = [button rac_signalForControlEvents:UIControlEventTouchUpInside];

  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(0);
    make.width.height.mas_equalTo(100);
  }];
}

@end
