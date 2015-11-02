//
//  ValueTableViewCell.h
//  ReservationSF
//
//  Created by renxuan on 15/10/30.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValueTableViewCell : UITableViewCell
@property(nonatomic,retain)UILabel *price_text_label;
@property(nonatomic,retain)UILabel *name_text_label;
@property(nonatomic,retain)UILabel *combo_text_label;
@property(nonatomic,retain)UILabel *restaurant_text_label;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
