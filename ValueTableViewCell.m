//
//  ValueTableViewCell.m
//  ReservationSF
//
//  Created by renxuan on 15/10/30.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "ValueTableViewCell.h"

@implementation ValueTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.name_text_label = [self create_label_with_frame:CGRectMake( 10, 12,60,10) :20.0f];
        self.combo_text_label=[self create_label_with_frame:CGRectMake(160,12 , 150, 80) :15.0f];
        self.restaurant_text_label =[self create_label_with_frame:CGRectMake(10, 12, 150, 80) :15.0f];
        self.price_text_label = [self create_label_with_frame:CGRectMake(700,20,(self.frame.size.width - 160),30 ):15.0f];
    }
    return self;
}
-(UILabel *)create_label_with_frame:(CGRect)frame :(double)fontSize
{
    UILabel *label =[[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    [self addSubview:label];
    return label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


@end
