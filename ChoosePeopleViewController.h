//
//  ChoosePeopleViewController.h
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosePeopleViewController :UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *tableview;
    NSArray *nameArray;
}


@end
