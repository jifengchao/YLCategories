//
//  NSFileManager+YLFile.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (YLFile)

/** 移除文件夹下所有文件<suffix后缀名>*/
- (void)yl_removeAllFileAtPath:(NSString *)path suffix:(NSString *)suffix;

@end
