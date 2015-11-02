//
//  ChoosePackageViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "ChoosePackageViewController.h"

@interface ChoosePackageViewController ()

@end

@implementation ChoosePackageViewController

-(id)initWithDataArray :(NSArray *)packageArray
{
    self = [super init];
    if (self)
    {
        PackageArray = packageArray;
    }
    
    return self ;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选套餐";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[PackageArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellPackage = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellPackage];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellPackage];
    }
    
    int row = (int)indexPath.row;
    cell.textLabel.text = [[PackageArray objectAtIndex:row]objectForKey:@"name"];
    cell.detailTextLabel.text = [[PackageArray objectAtIndex:row]objectForKey:@"price"];
    cell.textLabel.numberOfLines = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSDictionary *titleStringPackage =[PackageArray objectAtIndex:[indexPath row]];
    // 通知指令
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notfactionCobmo" object:titleStringPackage userInfo:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end

