//
//  ZQExtraUnit.h
//  ZQMusicPlayer
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                   佛祖保佑           永无BUG
//         .............................................
//
//  Created by 侯康柱 on 16/4/2.
//  Copyright © 2016年 HKZ. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  快速工具
 */
@interface ZQExtraUnit : NSObject

/**
 *  给View设置圆角
 *
 *  @param view    要设置的控件
 *  @param corners 圆角大小
 */
+ (void)viewSetCorners:(UIView *)view cornersSize:(CGFloat)corners;

/**
 *  给View设置圆角和边框
 *
 *  @param view    要设置的控件
 *  @param border  边框宽度
 *  @param color   边框颜色
 *  @param corners 圆角大小
 */
+ (void)viewSetBorder:(UIView *)view
               border:(CGFloat)border
          borderColor:(UIColor *)color
               corner:(CGFloat)corners ;


+ (UIButton *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect)frame
                           nomImage:(NSString *)imgName
                              taget:(id)taget
                             select:(SEL)select;

+ (UILabel *)createLabelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                           frame:(CGRect)frame
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment;

+ (void)showAlertWithTitle:(NSString *)title;
@end
