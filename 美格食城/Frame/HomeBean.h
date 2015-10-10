//
//  HomeBean.h
//  美格食城
//
//  Created by qf on 15/10/9.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeBean : NSObject

@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *rightDesc;
@property (nonatomic,copy) NSString *flagImage;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *leftDesc;

+(HomeBean *)netDataToHomeBean:(NSDictionary *)dict;
+(NSArray *)netDataToHomeArray:(NSArray *)array;
+(NSArray *)netdataToHomeArr:(id)object;
@end
