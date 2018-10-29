//
//  WLNData+Net.m
//  KangYangChain
//
//  Created by edz on 2018/10/29.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNData+Net.h"

@implementation WLNData (Net)

- (void)__getDataWithUrl:(NSString *)url resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
    if (url.length == 0) {
        return;
    }else{
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            if (block) {
                
                block(responseObject);
            }
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureblock) {
            failureblock(error);
        }
        
        
        
        
    }];
    
}
- (void)__postDataWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
    if (url.length == 0) {
        return;
    }else{
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"contentType"];
    
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", @"text/plain",nil]];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            if (block) {
                
                block(responseObject);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureblock) {
            
            failureblock(error);
            
        }
        
    }];
    
    
    
    
    
}
- (void)getWithDic:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    [self __getDataWithUrl:dic[URLS] resultBlock:^(id result) {
        
        if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
            
            [delegate result:result sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
            
            [delegate faild:error sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    }];
    
    
    
    
}
- (void)postWithDic:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    [self __postDataWithUrl:dic[URLS] params:dic[PRAMAS] resultBlock:^(id result) {
        
        if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
            
            [delegate result:result sel:NSStringFromSelector(_cmd)];
            
        }
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
            
            [delegate faild:error sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    }];
    
    
    
}

@end
