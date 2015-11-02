//
//  ChoosePackageViewController.h
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosePackageViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *PackageArray;
}
-(id)initWithDataArray :(NSArray *)packageArray;
@end
