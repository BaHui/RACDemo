//
//  BHContentView.h
//  BHDemo
//
//  Created by QiaoBaHui on 2019/6/30.
//  Copyright © 2019 QiaoBaHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHContentView : UIView

@property (nonatomic, assign) NSInteger clickCount;
@property (nonatomic, strong) RACSignal *clickEventSignal;

@end

NS_ASSUME_NONNULL_END
