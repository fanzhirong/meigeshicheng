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


+(void)netWorkingManager:(NSString *)urlString
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
//                [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                    block(responseObject);
//                    
//                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                    [SVProgressHUD dismissWithError:@"Loading Error!" afterDelay:0.3];
//                }];
            }
                break;
                
            default:
                break;
        }
    }];
    [manager.reachabilityManager startMonitoring];

}
@end
