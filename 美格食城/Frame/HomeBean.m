//
//  HomeBean.m
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "HomeBean.h"
#import "ZJModelTool.h"
@implementation HomeBean


+(HomeBean *)netDataToHomeBean:(NSDictionary *)dict
{
    HomeBean *bean = [[HomeBean alloc]init];
    [bean setValuesForKeysWithDictionary:dict];
    return bean;
}
+(NSArray *)netDataToHomeArray:(NSArray *)array
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        HomeBean *bean = [HomeBean netDataToHomeBean:dict];
        [arr addObject:bean];
    }
    return arr;
}
+(NSArray *)netdataToHomeArr:(id)object
{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:&error];
    NSMutableString *str = dic[@"params"];
    [str stringByReplacingOccurrencesOfString:@"" withString:@"\\"];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    NSArray *arr = dict[@"nowDetailList"];
    for (NSDictionary *dica in arr) {
        HomeBean *bean = [[HomeBean alloc]init];
        bean.leftDesc = dica[@"leftDesc"];
        bean.rightDesc = dica[@"rightDesc"];
        bean.image = dica[@"image"];
        bean.flagImage = dica[@"flagImage"];
        [array addObject:bean];
    }
    return array;
}
@end
