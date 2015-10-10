//
//  HomeDetailTableViewCell.h
//  美格食城
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 fanzhirong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *DetailImage;
@property (weak, nonatomic) IBOutlet UIImageView *CountryImage;

@property (weak, nonatomic) IBOutlet UILabel *CountryContent;
@property (weak, nonatomic) IBOutlet UILabel *Content;

-(void)setCellData:(id)object;
@end
