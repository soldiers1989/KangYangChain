//
//  NSObject+RouteRoot.h
//  XPSPlatform
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RouteRoot)

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion;


@end
