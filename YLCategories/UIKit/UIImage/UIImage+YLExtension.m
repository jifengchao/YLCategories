//
//  UIImage+YLExtension.m
//  YLCategories
//
//  Created by HH on 2021/6/30.
//

#import "UIImage+YLExtension.h"

#import <Photos/Photos.h>

@implementation UIImage (YLExtension)

/** 拼接图片快照*/
+ (UIImage *)yl_getImageFromImagesArray:(NSArray *)imagesArr {
    if (imagesArr.count == 0) return nil;
    
    UIImage *image;
    @autoreleasepool {
        CGSize imageTotalSize = [self __getImageTotalSizeFromImagesArray:imagesArr];
        UIGraphicsBeginImageContextWithOptions(imageTotalSize, NO, [UIScreen mainScreen].scale);
        
        //拼接图片
        int imageOffset = 0;
        for (UIImage *images in imagesArr) {
            [images drawAtPoint:CGPointMake(0, imageOffset)];
            imageOffset += images.size.height;
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return image;
}

/** 保存图片到相册*/
- (void)yl_saveImageToPhotoLibrary:(UIImage *)image resultBlock:(void(^)(BOOL success))resultBlock {
    if (!image) {
        if (resultBlock) resultBlock(NO);
    } else {
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            // 写入图片到相册
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            // 主线程-处理结果
            dispatch_async(dispatch_get_main_queue(), ^{
                if (resultBlock) resultBlock(success);
            });
        }];
    }
    
}

#pragma mark private methods

/** 获取全部图片拼接后size*/
+ (CGSize)__getImageTotalSizeFromImagesArray:(NSArray *)imagesArr {
    CGSize totalSize = CGSizeZero;
    for (UIImage *image in imagesArr) {
        CGSize imageSize = [image size];
        totalSize.height += imageSize.height;
        totalSize.width = MAX(totalSize.width, imageSize.width);
    }
    return totalSize;
}

@end
