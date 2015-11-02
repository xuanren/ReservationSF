//
//  ChooseRestaurantViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "ChooseRestaurantViewController.h"

@interface ChooseRestaurantViewController ()

@end

@implementation ChooseRestaurantViewController

-(void)introdceTableView
{
    
    NSArray *arrayRest = [[NSArray alloc]initWithObjects:@"海皇粥店",@"松记糖水",@"文輝墨魚丸大王", nil];
    resrveArray  = arrayRest;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellResrve = @"cell";
    UITableViewCell *cell = [tableviewRestaurant dequeueReusableCellWithIdentifier: CellResrve];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellResrve];
    }
    cell.textLabel.text = [resrveArray objectAtIndex:[indexPath row]];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选餐厅";
    [self introdceTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resrveArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString*titleStringResrve =[resrveArray objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionReare" object:titleStringResrve userInfo:nil];
    [self. navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
