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

///注册摇一摇
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication]setApplicationSupportsShakeToEdit:YES];
    
    [self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self resignFirstResponder];
}

#pragma mark - ShakeToEdit 摇动手机之后的回调方法
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    //检测到摇动开始
    
    if (motion == UIEventSubtypeMotionShake) {
        
        [self showAdminRegist];
    }
    
}


- (void)showAdminRegist {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput
    ;
    
    alert.title = @"管理员注册";
    
    UITextField *nameTf = [alert textFieldAtIndex:0];
    nameTf.placeholder = @"输入用户名";
    
    UITextField *pswTF = [alert textFieldAtIndex:1];
    pswTF.placeholder = @"输入密码";
    
    [alert addButtonWithTitle:@"取消"];
    [alert addButtonWithTitle:@"确定"];
    [alert setButttonAction:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (stringIsEmpty(nameTf.text) || stringIsEmpty(pswTF.text)) {
            return ;
        }
        if (buttonIndex == 1) {
            [self registeWithUserName:nameTf.text psw:pswTF.text type:ZQUserTypeBoss];
        }
    }];
    [alert show];
}



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
    
    [self registeWithUserName:self.userNameTF.text psw:self.passwordTF.text type:ZQUserTypeCommon];
}

- (void)registeWithUserName:(NSString *)name psw:(NSString *)psw type:(ZQUserType)userType {
    ZQUserModel *newUser = [ZQUserModel new];
    newUser.userName = name;
    newUser.passWord = [psw MD5Hash];
    newUser.userType = userType;
    
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
