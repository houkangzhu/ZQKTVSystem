//
//  ZQRegisteViewController.m
//  ZQMusicPlayer
//
//  Created by 侯康柱 on 16/4/9.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import "ZQRegisteViewController.h"

@interface ZQRegisteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userTypeSC;
@property (weak, nonatomic) IBOutlet UIButton *registeBtn;
@property (weak, nonatomic) IBOutlet ZQLineView *phonelineView;
@property (weak, nonatomic) IBOutlet ZQLineView *pswLineView;

@end

@implementation ZQRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addDefaultBack];
    
    self.phonelineView.lineColor = kWhiteColor;
    self.pswLineView.lineColor = kWhiteColor;
    
    [ZQExtraUnit viewSetCorners:self.registeBtn cornersSize:6.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registeAction:(id)sender {
    if (stringIsEmpty(self.userNameTF.text)) {
         [ZQExtraUnit showAlertWithTitle:@"手机号不能为空！"];
        return;
    }
    if (stringIsEmpty(self.passwordTF.text)) {
         [ZQExtraUnit showAlertWithTitle:@"密码不能为空！"];
        return;
    }
    
    ZQUserModel *newUser = [ZQUserModel new];
    newUser.userName = self.userNameTF.text;
    newUser.passWord = self.passwordTF.text;
    newUser.userType = ZQUserTypeCommon;
    
    BOOL insertOK = [ZQFMDBTool insertUserToDatabase:newUser];
    
    [ZQExtraUnit showAlertWithTitle:insertOK?@"注册成功！":@"注册失败！(该用户已存在)"];
    
    if (insertOK) {
        self.userNameTF.text = @"";
        self.passwordTF.text = @"";
    }
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
