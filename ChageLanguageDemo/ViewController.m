//
//  ViewController.m
//  ChageLanguageDemo
//
//  Created by Zeus on 2017/5/22.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "ViewController.h"
#import "ZCLanguageManager.h"
#import "LanguageListVC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *aa = KGetTextFromKey(@"setting", @"MyEnglish");
    [self.pushBtn setTitle: aa forState:UIControlStateNormal];
    [self.pushBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];

    self.label.text = [[ZCLanguageManager shareInstance]getLanguageWithKey:@"content" table:@"MyEnglish"];
    
    NSLog(@"=========== %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"languageKey"]);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.label.text = [[ZCLanguageManager shareInstance]getLanguageWithKey:@"content" table:@"MyEnglish"];
    NSString *aa = [[ZCLanguageManager shareInstance]getLanguageWithKey:@"setting" table:@"MyEnglish"];
    [self.pushBtn setTitle: aa forState:UIControlStateNormal];
}


- (void)pushAction:(UIBarButtonItem *)sender
{
    LanguageListVC *listVC = [[LanguageListVC alloc]init];
    [self presentViewController:listVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
