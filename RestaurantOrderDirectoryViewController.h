//
//  RestaurantOrderDirectoryViewController.h
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantOrderDirectoryViewController :  UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *m_arr_data_source;
    NSMutableArray *m_arr_data_different_source;
    int person_number;
}
@end
