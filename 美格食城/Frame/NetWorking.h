//
//  NetWorking.h
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^netSuccess)(id object);
typedef void(^netFail)(NSError *error);

@interface NetWorking : NSObject


+(void)netWorkingManager:(NSString *)urlString success:(netSuccess)block fail:(netFail)failBlock;
+(void)getNetWorkData:(NSString *)urlString sucess:(netSuccess)block fail:(netFail)failBlock;
@end
