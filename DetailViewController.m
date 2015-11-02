//
//  DetailViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "DetailViewController.h"
#import "ForReservationViewController.h"
#import "RestaurantOrderDirectoryViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订餐";
    [self backItem];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [self create_button];
//    [self arry_filePathName];
}
-(void)create_button
{
    double width = self.view.frame.size.width;
    //    设置字体大小
    [self create_button: width :@selector(order_button_pressed:) :90 :@"帮订餐"];
    [self create_button: width :@selector(look_up_ordered_restaurant:) :150 :@"看订餐"];
}
-(void)backItem
{
    //  设置返回页面
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItem.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
}
-(void)arry_filePathName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if(!docDir)
    {
        NSLog(@"Douments 目录未找到");
    }
    NSArray *array = [[NSArray alloc]initWithObjects:@"内容",@"content", nil];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testing.txt"];
    [array writeToFile:filePath atomically:YES];
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"灵素",@"景泽",@"夏冬",@"凌曦",@"景瑞",nil];
    NSString *filePathName = [docDir stringByAppendingPathComponent:@"orderName.plist"];
    [nameArray writeToFile:filePathName atomically:YES];
}
- (UIButton *)create_button :(double)width :(SEL)btn_pressed :(double)y :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:btn_pressed forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(width/8,y , 3*width/4, 35);
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.cornerRadius = 10.0;
    [self.view addSubview:button];
    return button;
}
-(void)order_button_pressed:(id)sender
{
        ForReservationViewController *order = [[ForReservationViewController alloc]init];
        [self.navigationController pushViewController:order animated:YES];
}
- (void)look_up_ordered_restaurant :(id)sender
{
        RestaurantOrderDirectoryViewController *find_order = [[RestaurantOrderDirectoryViewController alloc]init];
        [self.navigationController pushViewController:find_order animated:YES];
}

@end

