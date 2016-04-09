//
//  bookingVC.m
//  PulaStar
//
//  Created by CaniggiaGoal on 16/3/29.
//  Copyright © 2016年 PulaStar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "bookingVC.h"
#import "MyLoginModel.h"
#import "bookingTimePickerView.h"

@interface bookingVC ()<UITableViewDataSource,UITableViewDelegate,bookingTimePickerViewDelegate>
{
    UITextField     *txtUserName;
    UITextField     *txtParentName;
    UITextField     *txtAge;
    UITextField     *txtMobile;
    UILabel         *branchLabel;
    UITableView     *branchView;
    
    LMDropdownView  *dropdownView;
    UIButton        *btnBranch;
    UIButton        *btnBooking;
    NSArray         *arrOfBranch;
    NSArray         *arrofBranchNo;
    NSInteger       indexBranch;
    //NSString        *branchSelected;
    NSString        *bookingTimeSelected;
    
    NSArray   *bookingTimeArray;
    
}
@end

@implementation bookingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我 要 试 听";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self) wSelf = self;
    
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
    
    
    [self actionCustomLeftBtnWithNrlImage:@"btnback" htlImage:@"btnback" title:@"" action:^{
        [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithRenderColor:MYINFO_NAVBAR_COLOR renderSize:CGSizeMake(10., 10.)] forBarMetrics:UIBarMetricsDefault];
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    bookingTimeArray = @[@"09:00-10:30",@"13:00-14:00",@"14:30-15:30",@"16:00-17:00",@"19:00-20:00"];
    
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, mainWidth/2, 20)];
    name.text = @"姓名:";
    name.textColor = [UIColor blackColor];
    name.font = [UIFont systemFontOfSize:16];
    name.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:name];
    
    
    txtUserName = [[UITextField alloc] initWithFrame:CGRectMake(15, 35, mainWidth - 30, 20)];
    txtUserName.placeholder = @"请输入姓名";
    txtUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUserName.font = [UIFont systemFontOfSize:14];
    //txtUserName.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view  addSubview:txtUserName];
    
    
    UILabel *parentName = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, mainWidth/2, 20)];
    parentName.text = @"家长姓名:";
    parentName.textColor = [UIColor blackColor];
    parentName.font = [UIFont systemFontOfSize:16];
    parentName.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:parentName];
    
    
    txtParentName = [[UITextField alloc] initWithFrame:CGRectMake(15, 85, mainWidth - 30, 20)];
    txtParentName.placeholder = @"请输入家长姓名";
    txtParentName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtParentName.font = [UIFont systemFontOfSize:14];
    //txtParentName.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view  addSubview:txtParentName];
    
   
    UILabel *age = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, mainWidth/2, 20)];
    age.text = @"年龄(周岁):";
    age.textColor = [UIColor blackColor];
    age.font = [UIFont systemFontOfSize:16];
    age.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:age];
    
    
    txtAge = [[UITextField alloc] initWithFrame:CGRectMake(15, 135, mainWidth - 30, 20)];
    txtAge.placeholder = @"请输入年龄";
    txtAge.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAge.font = [UIFont systemFontOfSize:14];
    txtAge.keyboardType = UIKeyboardTypeNumberPad;
    //txtParentName.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view  addSubview:txtAge];
    
    UILabel *mobile = [[UILabel alloc] initWithFrame:CGRectMake(15, 160, mainWidth/2, 20)];
    mobile.text = @"手机号码:";
    mobile.textColor = [UIColor blackColor];
    mobile.font = [UIFont systemFontOfSize:16];
    mobile.textAlignment = NSTextAlignmentLeft;
 
    [self.view addSubview:mobile];
    
   
    txtMobile = [[UITextField alloc] initWithFrame:CGRectMake(15, 185, mainWidth - 30, 20)];
    txtMobile.placeholder = @"请输入电话号码";
    txtMobile.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtMobile.font = [UIFont systemFontOfSize:14];
    txtMobile.keyboardType = UIKeyboardTypePhonePad;
    //txtParentName.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUsername];
    [self.view  addSubview:txtMobile];
    
    UILabel *branch = [[UILabel alloc] initWithFrame:CGRectMake(15, 210, mainWidth*0.3 - 15, 20)];
    branch.text = @"校区分部:";
    branch.textColor = [UIColor blackColor];
    branch.font = [UIFont systemFontOfSize:16];
    branch.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:branch];
    
    arrOfBranch = @[@"源深香榭丽花园校区",@"金桥文峰广场校区",@"金桥禹州国际校区"];
    
    arrofBranchNo = @[@"003",@"004",@"002"];
    
    indexBranch = 0;
    
    branchView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    branchView.delegate = self;
    branchView.dataSource = self;
    branchView.backgroundColor = [UIColor whiteColor];
    branchView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    branchView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    
    btnBranch = [[UIButton alloc] initWithFrame:CGRectMake(mainWidth*0.3, 210, mainWidth*0.7, 20)];
    
    [btnBranch setTitle:[arrOfBranch objectAtIndex:indexBranch] forState:UIControlStateNormal];
    btnBranch.titleLabel.font = [UIFont systemFontOfSize:16];
    //[btnBranch setBackgroundColor:[UIColor hexFloatColor:@"f8f8f8"]];
    
    [btnBranch setBackgroundColor:MYINFO_NAVBAR_COLOR];
    
    [btnBranch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnBranch addTarget:self action:@selector(btnBranchAction) forControlEvents:UIControlEventTouchUpInside];
    btnBranch.layer.cornerRadius = 5;

    [btnBranch setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [btnBranch setImageEdgeInsets:UIEdgeInsetsMake(0,0,8,8)];
    [self.view addSubview:btnBranch];
    
    
    UILabel *bookingTime = [[UILabel alloc] initWithFrame:CGRectMake(15, 240, mainWidth*0.3 - 15, 20)];
    bookingTime.text = @"预约时间:";
    bookingTime.textColor = [UIColor blackColor];
    bookingTime.font = [UIFont systemFontOfSize:16];
    bookingTime.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:bookingTime];

    
    
    btnBooking = [[UIButton alloc] initWithFrame:CGRectMake(mainWidth*0.3, 240, mainWidth*0.7, 20)];
    btnBooking.layer.cornerRadius = 5;
    btnBooking.backgroundColor = MYINFO_NAVBAR_COLOR;
    [btnBooking setTitle:@"选        择" forState:UIControlStateNormal];
    [btnBooking addTarget:self action:@selector(buttonBookingTimeSelectAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBooking];
    
    
    dropdownView = [[LMDropdownView alloc] init];
    dropdownView.menuBackgroundColor = [UIColor whiteColor];
    dropdownView.menuContentView = branchView;
    
    
    UIButton* btnEnter = [[UIButton alloc] initWithFrame:CGRectMake(16, 350, mainWidth - 32, 44)];
    btnEnter.layer.cornerRadius = 5;
    btnEnter.backgroundColor = MYINFO_NAVBAR_COLOR;
    [btnEnter setTitle:@"确    认" forState:UIControlStateNormal];
    [btnEnter addTarget:self action:@selector(btnBookingAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnEnter];
    
    
}




#pragma mark - action


- (IBAction)buttonBookingTimeSelectAction{
    
    bookingTimePickerView *picker = [bookingTimePickerView new];
    //    picker.dataSource = @[@[@"1",@"1-2"],@[@"2",@"2-2",@"2-3"]];
    picker.delegate = self;
    [picker show];
}

- (void)bookingTime_pickerView:(bookingTimePickerView *)pickerView didSelectRow:(NSInteger)row section:(NSInteger)component {
    //    NSMutableArray<NSArray<NSString *> *> *newDataSource = [pickerView.dataSource mutableCopy];
    //    if (component == 0 ) {
    //        newDataSource[1] = @[[NSString stringWithFormat:@"change%zi-1",row],[NSString stringWithFormat:@"change%zi-2",row]];
    //    }
    //    pickerView.dataSource = newDataSource;
    //    [pickerView reloadDataWithSection:1];
}

- (void)bookingTime_pickerViewConfirmAction:(bookingTimePickerView *)pickerView didSelectArray:(NSArray<NSNumber *> *)selectedArray {
    
    NSLog(@"！！！%@--",selectedArray);
    
    NSInteger year = [[selectedArray objectAtIndex:0] intValue] + 2016;
    NSInteger month = [[selectedArray objectAtIndex:1] intValue] + 1;
    NSInteger day = [[selectedArray objectAtIndex:2] intValue] + 1;
    NSInteger  time = [[selectedArray objectAtIndex:3] intValue];
    
    bookingTimeSelected = [[NSString alloc ]initWithFormat:@"%ld-%ld-%ld+%@",year,month,day,[bookingTimeArray objectAtIndex:time]];
    
    [btnBooking setTitle:bookingTimeSelected forState:UIControlStateNormal];
    
}



- (void)btnBranchAction
{
    if ([dropdownView isOpen])
    {
        [dropdownView hide];
    }
    else
    {
        [branchView reloadData];

        [dropdownView showInView:self.view withFrame:CGRectMake(0, 210, mainWidth , self.view.bounds.size.height - 210)];
        
    }
}


- (void)btnBookingAction
{
    if(txtUserName.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入姓名"];
        return;
    }
    if(txtParentName.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入家长姓名"];
        return;
    }
    
    if(txtAge.text.length==0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入年龄"];
        return;
    }
    
    if(txtMobile.text.length == 0)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入手机号码"];
        return;
    }
    
    if([MyLoginModel isMobileNumber:(NSString*) txtMobile.text ] == NO)
    {
        [[XBToastManager ShardInstance] showtoast:@"请输入正确的手机号码"];
        return;
    }
    
    if(bookingTimeSelected == nil)
    {
        [[XBToastManager ShardInstance] showtoast:@"请选择预约时间"];
        return;
    }
    
    
    [[XBToastManager ShardInstance] showprogress];
    
    //__weak typeof (self) wSelf = self;

    
    [MyLoginModel auditionCreate:(NSString *)txtParentName.text studentName:(NSString *)txtUserName.text branchNo:(NSString *)[arrofBranchNo objectAtIndex:indexBranch] bookingTime:(NSString *)bookingTimeSelected age:(NSString *)txtAge.text phone:(NSString *)txtMobile.text success:^(AFHTTPRequestOperation* operation, NSObject* result){
    
        BOOL error = [[(NSDictionary*)result objectForKey:@"error"] boolValue];
        
        if(error == FALSE)   //登陆成功
        {
            [[XBToastManager ShardInstance] hideprogress];
            [[XBToastManager ShardInstance] showtoast:@"预约成功"];
            
            
        }
        else   //登陆失败
        {
            [[XBToastManager ShardInstance] hideprogress];
            
            [[XBToastManager ShardInstance] showtoast:@"预约失败，请确认信息"];
            
        }
    } failure:^(NSError* error){
        
        [[XBToastManager ShardInstance] hideprogress];
        [[XBToastManager ShardInstance] showtoast:@"预约失败，请检查网络"];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrOfBranch.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =  nil;//(UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"          %@", [arrOfBranch objectAtIndex:indexPath.row]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    indexBranch = indexPath.row;
    [btnBranch setTitle:[arrOfBranch objectAtIndex:indexBranch] forState:UIControlStateNormal];
    //branchSelected = [arrOfBranch objectAtIndex:indexBranch];
    [branchView reloadData];
    [dropdownView hide];
    
    
    
}


@end
