//
//  SecondViewController.m
//  Demo_反向传值
//
//  Created by LZXuan on 15-3-23.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "SecondViewController.h"
#import "MyControl.h"
#define kDebugPrint NSLog(@"%s",__func__)

@interface SecondViewController ()
{
    UITextField *_textField;
}
@end

@implementation SecondViewController
- (void)dealloc{
    [super dealloc];
    kDebugPrint;
}
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
    self.view.backgroundColor = [UIColor orangeColor];
    [self showUI];
    
}
- (void)showUI {
    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(10, 30, 300, 30) target:self sel:@selector(btnClick:) tag:301 image:nil title:@"返回"];
    [self.view addSubview:button];
    
    UIButton *button2 = [MyControl creatButtonWithFrame:CGRectMake(10,200 , 300, 30) target:self sel:@selector(btnClick2:) tag:302 image:nil title:@"传值"];
    [self.view addSubview:button2];
    
    
    _textField = [MyControl creatTextFieldWithFrame:CGRectMake(10, 100, 300, 30) placeHolder:nil delegate:nil tag:100];
    [self.view addSubview:_textField];
}
//收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
}

//点击开关的时候 调用
- (void)btnClick2:(UIButton *)button{
    if (self.myBlock) {
        self.myBlock(_textField.text);
    }else {
        NSLog(@"没有传入block");
    }
}

- (void)btnClick:(UIButton *)btn {
    //返回上一级
    [self dismissViewControllerAnimated:YES completion:nil];
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
