//
//  UIViewController+Set.h
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Set) <WLNReqstProtocol>

typedef NS_ENUM(NSInteger, TAB_FRAME_TYPE) {
    
    CUT_TOPDOWN = 0,
    CUT_TOP,
    CUT_DOWN,
    
};
/**
 属性
 */
@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, assign) TAB_FRAME_TYPE type;


- (void)push:(UIViewController *)vc;

- (void)tabType:(TAB_FRAME_TYPE)type;

- (void)customPop;

- (CGRect)resetTabFrame;

- (CGRect)resetEmptyFrame;

@end

NS_ASSUME_NONNULL_END
