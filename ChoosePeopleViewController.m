//
//  ChoosePeopleViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "ChoosePeopleViewController.h"

@interface ChoosePeopleViewController ()

@end

@implementation ChoosePeopleViewController

-(void)personnelList
{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    NSArray *array = [[NSArray alloc]initWithObjects:@"灵素",@"景泽",@"夏冬",@"凌曦",@"景瑞", nil];
    nameArray  = array;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [nameArray objectAtIndex:[indexPath row]];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订餐";
    [self personnelList];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
{
    return [nameArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titileString = [nameArray objectAtIndex:[indexPath row]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionName" object:titileString userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
