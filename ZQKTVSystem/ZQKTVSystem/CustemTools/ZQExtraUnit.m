//
//  ZQExtraUnit.m
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

#import "ZQExtraUnit.h"



@implementation ZQExtraUnit

+ (void)viewSetCorners:(UIView *)view cornersSize:(CGFloat)corners {
    [view layoutSubviews];
    [view layoutIfNeeded];
    
    view.layer.cornerRadius = corners;
    view.clipsToBounds = YES;
}

+ (void)viewSetBorder:(UIView *)view
               border:(CGFloat)border
          borderColor:(UIColor *)color
               corner:(CGFloat)corners {
    [view layoutSubviews];
    [view layoutIfNeeded];
    
    view.layer.cornerRadius = corners;
    view.clipsToBounds = YES;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = border;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect)frame
                           nomImage:(NSString *)imgName
                              taget:(id)taget
                             select:(SEL)select {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    if (imgName) {
        [button setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setTarget:taget action:select forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:taget action:select forControlEvents:UIControlEventTouchUpInside];
    return button;

}

+ (UILabel *)createLabelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                           frame:(CGRect)frame
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    if (!textColor) {
        label.textColor = [UIColor blackColor];
    }
    else
        label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

+ (void)showAlertWithTitle:(NSString *)title {
    [[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}

+ (void)showInfo:(NSString *)info {
    
}

+ (CGFloat)textGetWidth:(NSString *)text font:(UIFont *)font maxHeight:(CGFloat)maxHeight {

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight) options: NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return textRect.size.width;
}


+ (CGFloat)textGetHeight:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    //    CGSize textSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, maxHeight) lineBreakMode:UILineBreakModeWordWrap];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return textRect.size.height;
}



+ (UIWindow *)getKeyWindow {
    return [UIApplication sharedApplication].delegate.window;
}

/**
 UIGraphicsBeginImageContext(size);
 
 [imagedrawInRect:CGRectMake(0,0,size.width,size.height)];
 
 UIImage*newImage=UIGraphicsGetImageFromCurrentImageContext();
 
 UIGraphicsEndImageContext();
 
 returnnewImage;
 */

+ (UIImage *)zoomImage:(UIImage *)oldImage MinSize:(CGFloat)minSize {
    CGSize imgSize = oldImage.size;
    CGSize newSize = CGSizeZero;
    if (imgSize.width>imgSize.height) {
        newSize.height = minSize;
        newSize.width = minSize*(imgSize.width/imgSize.height);
    }else {
        newSize.width = minSize;
        newSize.height = minSize*(imgSize.height/imgSize.width);
    }
    UIGraphicsBeginImageContext(newSize);
    [oldImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext()
    ;
    UIGraphicsEndImageContext();
    return newImage;
}
@end
