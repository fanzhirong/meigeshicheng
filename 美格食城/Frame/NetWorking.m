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
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
//    NSDictionary *dic = @{@"os":@"1",@"params":@"%7B%22type%22%3A%222%22%2C%22nowList%22%3A%5B1957%2C1232%2C1952%2C1559%2C1920%2C1857%2C1368%2C1943%2C1941%2C513%2C1418%2C1947%2C307%2C1945%2C1235%2C1612%2C1657%2C1854%2C1905%2C1939%5D%2C%22accountId%22%3A%22159224%22%7D",@"sign":@"4926977F3E2C172C",@"version":@"1.8"};
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manager POST:@"http://app.gegejia.com/yangege/appNative/resource/homeDetail?os=1&params=%7B%22type%22%3A%222%22%2C%22nowList%22%3A%5B1976%2C1956%2C1972%2C1160%2C1980%2C1054%2C1867%2C526%2C1776%2C1959%2C212%2C906%2C1426%2C1319%2C1634%2C1955%2C1960%2C709%2C1173%2C1311%5D%2C%22accountId%22%3A%22159224%22%7D&sign=7FC32DB9181D781D&version=1.8" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(error);
        NSLog(@"%@",error);
    }];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
//    [request setHTTPMethod:@"POST"];
//    NSString *str = @"os=1&params=%7B%22type%22%3A%222%22%2C%22nowList%22%3A%5B1976%2C1956%2C1972%2C1160%2C1980%2C1054%2C1867%2C526%2C1776%2C1959%2C212%2C906%2C1426%2C1319%2C1634%2C1955%2C1960%2C709%2C1173%2C1311%5D%2C%22accountId%22%3A%22159224%22%7D&sign=7FC32DB9181D781D&version=1.8";
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    [request setHTTPBody:data];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSLog(@"%@",data);
//    }];
    
}
@end
