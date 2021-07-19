//
//  NSFileManager+YLFile.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

/*
 https://blog.csdn.net/u011545929/article/details/17581239
 */

#import "NSFileManager+YLFile.h"

@implementation NSFileManager (YLFile)

/** 移除文件夹下所有文件<suffix后缀名>*/
- (void)yl_removeAllFileAtPath:(NSString *)path suffix:(NSString *)suffix {
    if (path.length == 0) return;
    if (![self fileExistsAtPath:path]) return; // 文件夹不存在
    
    NSFileManager *manager = self;
    NSArray *contents = [manager contentsOfDirectoryAtPath:path error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    
    NSString *filename;
    while (filename = [e nextObject]) {
        if (filename.length == 0) continue;
        if (suffix.length) {
            if ([filename hasSuffix:suffix]) {
                NSLog(@"------%@------", filename);
                [manager removeItemAtPath:[path stringByAppendingPathComponent:filename] error:NULL];
            }
        } else {
            [manager removeItemAtPath:[path stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}

@end
