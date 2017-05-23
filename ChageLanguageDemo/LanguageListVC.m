//
//  LanguageListVC.m
//  MyLangageDomo
//
//  Created by Zeus on 2017/5/22.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "LanguageListVC.h"
#import "ZCLanguageManager.h"

@interface LanguageListVC () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation LanguageListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identfire = @"identfire";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identfire];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfire];
    }
    if(indexPath.row == 0){
        cell.textLabel.text = [[ZCLanguageManager shareInstance]getLanguageWithKey:@"first" table:@"MyEnglish"];
    }
    if(indexPath.row == 1){
        cell.textLabel.text = [[ZCLanguageManager shareInstance]getLanguageWithKey:@"second" table:@"MyEnglish"];
    }
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //中文
    if(indexPath.row == 0){
        [[ZCLanguageManager shareInstance]setNewLanguage:@"zh-Hans"];
    }
    //英文
    if(indexPath.row == 1){
        [[ZCLanguageManager shareInstance]setNewLanguage:@"en"];
    }
    
    NSLog(@"***************** %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"languageKey"]);
        [self dismissViewControllerAnimated:NO completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
