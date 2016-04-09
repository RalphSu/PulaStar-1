//
//  UIImage+RenderedImage.m


#import "UIImage+RenderedImage.h"

@implementation UIImage (RenderedImage)
+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size {
    
    UIImage *image = nil;
    UIGraphicsBeginImageContext(size);
    [color setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0., 0., size.width, size.height));
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
