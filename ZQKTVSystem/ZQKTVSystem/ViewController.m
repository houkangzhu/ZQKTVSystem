//
//  ViewController.m
//  ZQKTVSystem
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ViewController.h"
#import "ZQMainLoginVC.h"
#import "ZQAdminMainController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logBtn;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    ZQAccount *account = [ZQAccountTools sharedZQAccountTools].currentAccount;
    NSString *bttonTitle = @"用户登录";
    if (!account) {
        [self.logBtn setTitle:bttonTitle forState:UIControlStateNormal];
        return;
    }
    if (account.userType == ZQUserTypeBoss) {
        bttonTitle = @"系统管理";
    }
    
    [self.logBtn setTitle:bttonTitle forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100: //登录
        {
            [self loginButtonAction:sender];
        }
            break;
            
        default:
            break;
    }
    
}


- (void)loginButtonAction:(UIButton *)sender {
    ZQAccount *account = [ZQAccountTools sharedZQAccountTools].currentAccount;
    if (!account) {
        [self loginAction];
    }else if (account.userType == ZQUserTypeBoss) {
        ZQAdminMainController *adminVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ZQAdminMainController"];
        [self.navigationController pushViewController:adminVC animated:YES];
    }
}

///登录
- (void)loginAction {
    ZQMainLoginVC *loginVC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"ZQMainLoginVC"];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}

@end
