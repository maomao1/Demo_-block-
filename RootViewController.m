//
//  RootViewController.m
//  Demo_反向传值
//
//  Created by LZXuan on 15-3-23.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "RootViewController.h"
#import "MyControl.h"
#import "SecondViewController.h"

#define kDebugPrint NSLog(@"%s",__func__)

//遵守协议
@interface RootViewController ()
{
     UILabel *_label;
}
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showUI];
}
- (void)showUI {
    self.view.backgroundColor = [UIColor grayColor];
    
    _label = [MyControl creatLabelWithFrame:CGRectMake(0, 30, 300, 30) text:@"XXX"];
    _label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_label];
    
    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(10, 200, 300, 50) target:self sel:@selector(btnClick:) tag:201 image:nil title:@"切换到第二张"];
    [self.view addSubview:button];
}

/*
 正向传值
 创建第一个界面   通过第一个界面跳转到第二个界面
 如果由第一个界面向第二个界面 进行传值 正向传值
 属性传值
 
 
 第二张向第一张界面传值 反向传值
 
 下级界面向上一级界面传值---》反向传值
 
 反向传值方式:
 
 1.代理传值
    下级界面要把textField的内容 传给 上一级，这时下级界面就可以委托上级界面 修改 label的值
    第二个界面(主动方) 可以制定一个协议 规范代理的行为，
    
    第一个界面(被动方) 遵守协议 作为 代理

 2.单例传值 1.系统单例 2.自定义单例
 
 3.通知传值
 
 4.NSUserDefaults
 
 5.block传值 回调 就是 代理设计模式
 1.block代码块 就相当于代理 那么block代码块写在哪里 写在被动方类中，并且传给主动方
 2.block变量需要定义在 主动方  
 3.谁来调用block 主动方调用
 
 */

- (void)btnClick:(UIButton *)btn {
    //每次点击按钮  都会创建一个新的第二张对象
    SecondViewController *svc = [[SecondViewController alloc] init];
    [svc setMyBlock:^(NSString *str) {
        _label.text = str;
    }];
    [self presentViewController:svc animated:YES completion:nil];
    [svc release];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
