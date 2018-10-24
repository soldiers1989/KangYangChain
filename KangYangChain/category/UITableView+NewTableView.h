//
//  UITableView+NewTableView.h
//  Moon
//
//  Created by mc on 16/12/15.
//  Copyright © 2016年 jingzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (NewTableView)

//- (void)fr_willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath fillColor:(UIColor *)cfillColor cornerRadius:(CGFloat)radius;
//- (void)fr_willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)fr_willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
