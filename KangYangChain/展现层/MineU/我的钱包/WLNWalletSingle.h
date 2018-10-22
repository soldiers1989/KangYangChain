//
//  WLNWalletSingle.h
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNWalletSingle : NSObject

@property (nonatomic, strong) NSString *privatekey; //私钥

@property (nonatomic, strong) NSString *address;   //地址

@property (nonatomic, strong) NSString *words;   //助记词

@property (nonatomic, strong) NSNumber *balance; //余额

@property (nonatomic, strong) NSNumber * rmb;

@property (nonatomic, strong) NSString *n_tx;

@property (nonatomic ,strong) NSString *total_received;

@property (nonatomic, strong) NSString *currentType;


@property (nonatomic, assign) double changeBalance; //换算后余额


@property (nonatomic, strong) NSMutableDictionary *dic;



+ (WLNWalletSingle *)shared;





@end

NS_ASSUME_NONNULL_END
