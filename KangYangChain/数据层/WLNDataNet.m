//
//  WLNDataNet.m
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNDataNet.h"

@implementation WLNDataNet
//get参数转字典
- (NSMutableDictionary *)__getParametersTransitionDic:(NSString *)url{
    
    if (url == nil) {
        return nil;
    }
    if (![url hasPrefix:@"?"]) {
        return nil;
    }
    NSRange range = [url rangeOfString:@"?"];
    
    NSString *propertys = [url substringFromIndex:range.location+1];
    
    NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc]init];
    
    for (int j = 0 ; j < subArray.count; j++)
    {
        NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
        
        if (dicArray.count >= 2) {
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
        }
        
    }
    
    return tempDic;
    
}
- (void)__getDataWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
- (void)getWithUrl:(NSString *)url resultBlock:(void(^)(id result))block{
    
    NSMutableDictionary *dic = [self __getParametersTransitionDic:url];
    
    [self __getDataWithUrl:url params:dic resultBlock:^(id result) {
        
        if (block) {
            block(result);
        }
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        NSLog(@"%@",[NSString stringWithFormat:@"%ld",error.code]);
        
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%ld",error.code]];

    }];
    
}


- (void)postWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block{
    
    
    
    [self __postDataWithUrl:url params:params resultBlock:^(id result) {
        
        if (block) {
            block(result);
        }
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        NSLog(@"%@",[NSString stringWithFormat:@"%ld",error.code]);
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%ld",error.code]];

        
    }];
    
    
    
}
@end
