//
//  ViewController.m
//  ZQKTVSystem
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ViewController.h"
#import "ZQMainLoginVC.h"
@interface ViewController ()

@end

@implementation ViewController

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
            [self loginAction];
        }
            break;
            
        default:
            break;
    }
    
}

///登录
- (void)loginAction {
    ZQMainLoginVC *loginVC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"ZQMainLoginVC"];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}

@end
