//
//  ScrollViewLib.h
//  美格食城
//
//  Created by qf on 15/10/11.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewLib : UIViewController


@property(nonatomic,strong)NSArray *photoArray;

@property(nonatomic,assign)CGRect scrollViewFrame;

@property(nonatomic,assign)CGFloat pageControlHeight;

@property(nonatomic,assign)BOOL isNotLocalImage;

@end
