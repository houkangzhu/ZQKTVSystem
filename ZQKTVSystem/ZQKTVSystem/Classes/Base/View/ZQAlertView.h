//
//  ZQAlertView.h
//  ZQKTVSystem
//
//  Created by 侯康柱 on 16/4/23.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQAlertView : UIView

SingleInterface(ZQAlertView)

+ (void)showTitle:(NSString *)title;


@end

@interface ZQAlertView (Progress)

+ (void)showProgressHUD;

+ (void)hidenProgressHUD;
@end