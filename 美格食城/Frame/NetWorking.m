//
//  NetWorking.m
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "NetWorking.h"
#import <AFNetworking.h>
@implementation NetWorking


+(void)netWorkingManager:(NSString *)urlString success:(netSuccess)block fail:(netFail)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    __block AFHTTPRequestOperationManager *_manager = manager;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown://未知网络
                
                break;
            case AFNetworkReachabilityStatusNotReachable://断网
                //读取本地缓存文件（sqlite或者plist）
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN://移动网络
                
            case AFNetworkReachabilityStatusReachableViaWiFi://wifi
            {
                [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    block(responseObject);
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    failBlock(error);
                }];
            }
                break;
                
            default:
                break;
        }
    }];
    [manager.reachabilityManager startMonitoring];

}

+(void)getNetWorkData:(NSString *)urlString sucess:(netSuccess)block fail:(netFail)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(error);
    }];
}
@end
