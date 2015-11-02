//
//  ForReservationViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "ForReservationViewController.h"
#import "DetailViewController.h"
#import "ChoosePeopleViewController.h"
#import "ChooseRestaurantViewController.h"
#import "ChoosePackageViewController.h"
@interface ForReservationViewController ()

@end

@implementation ForReservationViewController

-(UILabel *)createLabelWithText : (NSString *)labelText :(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:label];
    return label;
}


-(UILabel *)createSelectLabelWithBorder :(CGRect)frame
{
    UILabel *pane = [[UILabel alloc]initWithFrame:frame];
    pane.text = @"";
    [self.view addSubview:pane];
    pane.layer.cornerRadius = 10.0;
    pane.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    pane.layer.borderWidth = 1;
    return pane;
}

-(void)getChoosePeopelNotifaction:(NSNotification *)aNotifaction
{
    // 选人反馈的通知
    m_nameLabel.text = aNotifaction.object;
}
-(void)getResrveRorRestaurant:(NSNotification *)bNotifaction
{
    // 选餐厅反馈的通知
    m_resrveLabel.text = bNotifaction.object;
}
-(void)getChooseCobmoNotifaction:(NSNotification *)cNotifaction
{
    NSDictionary *dicCobmo = cNotifaction.object;
    // 选套餐反馈的通知
    m_cobmoLabel.text = [dicCobmo objectForKey:@"name"];
    m_strprice = [dicCobmo objectForKey:@"price"];
}
-(void)create_Label_frame_button
{
    double width = self.view.frame.size.width;
    [self createLabelWithText:@"人：" :CGRectMake(width/15, 20, 120, 44)];
    [self createLabelWithText:@"餐厅：" :CGRectMake(width/15, 200, 120, 44)];
    [self createLabelWithText:@"套餐:" :CGRectMake(width/15, 370, 120, 44)];
    m_nameLabel = [self createSelectLabelWithBorder :CGRectMake(width/15,70, 13*width/15,44)];
    m_resrveLabel = [self createSelectLabelWithBorder:CGRectMake(width/15, 250, 13*width/15, 44)];
    m_cobmoLabel = [self createSelectLabelWithBorder:CGRectMake(width/15,420, 13*width/15,44)];
    [self create_button_with_frame];
}
- (void)create_button_with_frame
{
    double width = self.view.frame.size.width;
    [self create_button_with_frame:CGRectMake(width/15,140, 13*width/15,44) :@"选人" :@selector(choosePeopleButton:)];
    UIBarButtonItem *backItemReservation = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    backItemReservation.tintColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItemReservation];
    [self create_button_with_frame:CGRectMake(width/15,320, 13*width/15,44) :@"选餐厅" :@selector(chooseRestaurantButton:)];
    NSArray *arrPeople = [[NSArray alloc]initWithObjects:@"海皇粥店",@"松记糖水",@"文輝墨魚丸大王", nil];
    m_dicResrveLabel = [[NSDictionary alloc]initWithObjectsAndKeys:arrPeople,@"灵素",arrPeople,@"景泽",arrPeople,@"夏冬",arrPeople,@"凌曦",arrPeople,@"景瑞",nil];
    [self create_button_with_frame:CGRectMake(width/15,470, 13*width/15,44) :@"选套餐" :@selector(ChooseCobmoButton:)];
    [self create_button_with_frame:CGRectMake(width/15,520, 13*width/15,44) :@"确定" :@selector(confirmButtonPressed:)];
}
-(void)Dictionary_name_price
{
    NSDictionary *dic_H_One = [[NSDictionary alloc]initWithObjectsAndKeys:@"芙蓉炒活蟹",@"name",@"20",@"price",nil];
    NSDictionary *dic_H_Two= [[NSDictionary alloc]initWithObjectsAndKeys:@"茄酱鲜虾炒意粉",@"name",@"11",@"price", nil];
    NSArray *arr_H = [[NSArray alloc]initWithObjects:dic_H_One,dic_H_Two,nil];
    NSDictionary *dic_S_One = [[NSDictionary alloc]initWithObjectsAndKeys:@"豉香江虾炒韭菜",@"name",@"10",@"price", nil];
    NSDictionary *dic_S_Two =[[NSDictionary alloc]initWithObjectsAndKeys:@"酸菜腊肠米线",@"name",@"8",@"price",nil];
    NSArray *arr_S = [[NSArray alloc]initWithObjects:dic_S_One,dic_S_Two ,nil];
    NSDictionary *dic_W_One = [[NSDictionary alloc]initWithObjectsAndKeys:@"甜梨双丝",@"name",@"8",@"price", nil];
    NSDictionary *dic_W_Two = [[NSDictionary alloc]initWithObjectsAndKeys:@"双色豆腐",@"name",@"12",@"price",nil];
    NSArray *arr_W =[[NSArray alloc]initWithObjects:dic_W_One,dic_W_Two,nil];
    
    m_dicComboData =[[NSDictionary alloc]initWithObjectsAndKeys:arr_H,@"海皇粥店",arr_S,@"松记糖水",arr_W,@"文輝墨魚丸大王",nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    通知函数
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getChoosePeopelNotifaction:) name:@"notfactionName" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getResrveRorRestaurant:) name:@"notfactionReare" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector (getChooseCobmoNotifaction:)name:@"notfactionCobmo" object:nil];
    self.navigationItem.title = @"订餐";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = YES;
    [self create_Label_frame_button];
    [self Dictionary_name_price];
    
}

- (UIButton *)create_button_with_frame :(CGRect)frame :(NSString *)btn_title :(SEL)pressed_event
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:btn_title forState:UIControlStateNormal];
    button.layer.cornerRadius = 10.0f;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];
    button.layer.masksToBounds = YES;
    [button addTarget:self action:pressed_event forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (NSString *)getFilePathWithFileName :(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取沙盒中Documents文件的路径
    NSString *str_file_path = [paths objectAtIndex:0];
    //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
    NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:fileName];
    return str_data_file_path;
}

-(void)confirmButtonPressed :(id)sender
{
    if(![m_nameLabel.text isEqualToString: @""] && ![m_resrveLabel.text  isEqualToString: @""] && ![m_cobmoLabel.text  isEqualToString: @""])
    {
        [self m_label_text:(id)sender];
    }
}
-(void)m_label_text:(id)sender
{
    NSString *data_file_path = [self getFilePathWithFileName:@"order.plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:m_nameLabel.text,@"name",m_resrveLabel.text,@"restaurant",m_cobmoLabel.text,@"combo",m_strprice,@"price",nil];
    NSMutableArray *array_order = [[NSMutableArray alloc]initWithContentsOfFile:data_file_path];
    if (array_order == nil)
    {
        array_order = [[NSMutableArray alloc]initWithCapacity:0];
    }
    [array_order addObject:dic];
    BOOL is_save_success = [array_order writeToFile:data_file_path atomically:YES];
    if (is_save_success == true)
    {
        [(UIButton *)sender setEnabled:NO];
    }
}
-(void)choosePeopleButton:(id)sender
{
    ChoosePeopleViewController *choosePeople = [[ChoosePeopleViewController alloc]init];
    [self.navigationController pushViewController:choosePeople animated:YES];
}

-(void)chooseRestaurantButton:(id)senderForChooseRestaurant
{
    ChooseRestaurantViewController *chooseRestaurant = [[ChooseRestaurantViewController alloc]init];
    [self.navigationController pushViewController:chooseRestaurant animated:YES];
}

-(void)ChooseCobmoButton:(id)senderForChoosePackage
{
    NSArray *packageArray = [m_dicComboData objectForKey:m_resrveLabel.text];
    ChoosePackageViewController *choosePackage = [[ChoosePackageViewController alloc]initWithDataArray:packageArray];
    [self.navigationController pushViewController:choosePackage animated:YES];
}

@end
