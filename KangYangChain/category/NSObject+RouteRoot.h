//
//  NSObject+RouteRoot.h
//  XPSPlatform
//
//  Created by sy on 2017/11/17.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RouteRoot)

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion;


@end
