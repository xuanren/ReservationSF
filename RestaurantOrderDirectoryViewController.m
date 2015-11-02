//
//  RestaurantOrderDirectoryViewController.m
//  ReservationSF
//
//  Created by renxuan on 15/10/29.
//  Copyright (c) 2015年 renxuan. All rights reserved.
//

#import "RestaurantOrderDirectoryViewController.h"
#import "ValueTableViewCell.h"
@interface RestaurantOrderDirectoryViewController ()

@end

@implementation RestaurantOrderDirectoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    self.title = @"订餐";
    //    获取沙盒内的文件
    m_arr_data_source = [self read_file_from_path:@"order.plist"];
    m_arr_data_different_source = [self read_file_from_path:@"orderName.plist"];
    person_number = (int)m_arr_data_different_source.count;
    double sum_price = [self get_ordered_sum_price];
    [self creat_label_price:sum_price];
}

-(double)get_ordered_sum_price
{
    [self sum_price_name];
    double sum_price = 0;
    for (int k = 0; k < m_arr_data_source.count; k++)
    {
        NSDictionary *priceinfo = [m_arr_data_source objectAtIndex:k];
        NSString *strprice = [priceinfo objectForKey:@"price"];
        double double_price = strprice.doubleValue;
        sum_price = sum_price + double_price;
    }
    return sum_price;
}
-(void)sum_price_name//未选人名
{
    for (int i = 0; i < m_arr_data_source.count; i++)
    {
        NSDictionary *orderinfo = [m_arr_data_source objectAtIndex:i];
        NSString *strName = [orderinfo objectForKey:@"name"];
        for (int j = 0; j < m_arr_data_different_source.count; j++)
        {
            NSString *name = [m_arr_data_different_source objectAtIndex:j];
            if ([strName isEqualToString:name])
            {
                [m_arr_data_different_source removeObject:name];
                break;
            }
        }
    }
}

-(UILabel *)creat_label_price:(double)sum_price
{
    int thePackageNumber = person_number - (int)m_arr_data_different_source.count;
    //   声明一个lable把sum_price 放到lable里。
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-104, self.view.frame.size.width, 40)];
    label.backgroundColor = [UIColor blackColor];
    label.text = [[NSString alloc]initWithString:[NSString stringWithFormat:@"未定:%lu人 已定:%d人 总计%.2f元",(unsigned long)m_arr_data_different_source.count,thePackageNumber,sum_price]];
    label.font = [UIFont fontWithName:@"Arial" size:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label];
    return label;
}

//沙盒机制
- (NSMutableArray *)read_file_from_path:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取沙盒中Documents文件的路径
    NSString *str_file_path = [paths objectAtIndex:0];
    //将自己想创建的文件名添加到Documents录后，拼成一整个字符串
    NSString *str_data_file_path = [str_file_path stringByAppendingPathComponent:fileName];
    NSMutableArray *array_data_source = [[NSMutableArray alloc]initWithContentsOfFile:str_data_file_path];
    return array_data_source;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/* 这个函数是显示tableview的章节数*/
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 2;
}
/*设置标题尾的宽度*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

/*设置标题头的名称*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
//    int thePackageNumber = person_number - (int)m_arr_data_different_source.count;
    // 标题设置
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor lightGrayColor];
    if (section == 0)
    {
        UILabel *labelready =[[UILabel alloc]initWithFrame:CGRectMake(0,0,200,30)];
        labelready.text = [NSString stringWithFormat:@"已定套餐%d人",m_arr_data_source.count];
        [view addSubview:labelready];
    }
    else
    {
        UILabel *lableUnready = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        lableUnready.text =[NSString stringWithFormat:@"未定套餐%u人",(unsigned )m_arr_data_different_source.count];
        [view addSubview:lableUnready];
    }
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 返回多少行
    if(section == 0)
    {
        return m_arr_data_source.count;
    }
    if (section == 1)
    {
        return m_arr_data_different_source.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    声明静态字符串型对象，用来标记重用单元格
    static NSString *CellIdentifier = @"cells";
    //    用TableSampleIdentifier表示需要重用的单元
    ValueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    如果如果没有多余单元，则需要创建新的单元
    if (cell == nil)
    {
        cell = [[ValueTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section == 0)
    {
        [self tableViewSceion:indexPath atCell:cell];
    }
    if (indexPath.section == 1)
    {
        cell.textLabel.text = [m_arr_data_different_source objectAtIndex:indexPath.row];
    }
    return cell;
}

-(UITableViewCell *)tableViewSceion:(NSIndexPath *)indexPath atCell:(ValueTableViewCell *)cell
{
    NSUInteger row = [indexPath row];
    //获取当价钱前值的行数
    NSString *str_price = [[m_arr_data_source objectAtIndex:row]objectForKey:@"price"];
    NSString *str_vele = [[NSString alloc]initWithString:str_price];
    //加尾缀“￥”
    NSString *str_show_value = [str_vele stringByAppendingString:@"￥"];
    //将价钱值类型转换成double类型，
    double d_price = str_vele.doubleValue ;
    //        将价钱值作比较大于11的数显示为红色。
    if (d_price > 11.00)
    {
        cell.price_text_label.textColor = [UIColor redColor];
    }
    cell.name_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"name"];
    cell.price_text_label.text =  str_show_value;
    cell.restaurant_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"restaurant"];
    cell.combo_text_label.text = [[m_arr_data_source objectAtIndex:row]objectForKey:@"combo"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
