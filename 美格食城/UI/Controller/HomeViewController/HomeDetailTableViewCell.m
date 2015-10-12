//
//  HomeDetailTableViewCell.m
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import "HomeDetailTableViewCell.h"
#import "HomeDetailFirstBean.h"
#import "HomeDetailSecondBean.h"
#import <UIImageView+WebCache.h>
@implementation HomeDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setCellData:(id)object
{
    if ([object isKindOfClass:[HomeDetailFirstBean class]]) {
        HomeDetailFirstBean *bean = object;
        [self.DetailImage setImageWithURL:[NSURL URLWithString:bean.image] placeholderImage:[UIImage imageNamed:@"square_default_icon@2x"]];
        [self.CountryImage setImageWithURL:[NSURL URLWithString:bean.flagImage] placeholderImage:[UIImage imageNamed:@""]];
        self.CountryContent.text = bean.leftDesc;
        self.Content.text = bean.rightDesc;
        
        self.topView.backgroundColor = [UIColor whiteColor];
        self.topView.alpha = 0;
    }
    else
    {
        HomeDetailSecondBean *bean = object;
        
        [self.DetailImage setImageWithURL:[NSURL URLWithString:bean.image] placeholderImage:[UIImage imageNamed:@"square_default_icon@2x"]];
        [self.CountryImage setImageWithURL:[NSURL URLWithString:bean.flagImage] placeholderImage:[UIImage imageNamed:@""]];
        self.CountryContent.text = bean.leftDesc;
        self.Content.text = bean.rightDesc;
        
        self.topView.backgroundColor = [UIColor blackColor];
        self.topView.alpha = 0.2;
        //self.storeButton setImage:[UIImage ] forState:<#(UIControlState)#>
    }
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
