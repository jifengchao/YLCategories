//
//  UIImage+YLExtension.h
//  YLCategories
//
//  Created by HH on 2021/6/30.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLExtension)

/** 拼接图片快照*/
+ (UIImage *)yl_getImageFromImagesArray:(NSArray *)imagesArr;

/** 保存图片到相册*/
- (void)yl_saveImageToPhotoLibrary:(UIImage *)image resultBlock:(void(^)(BOOL success))resultBlock;

@end

