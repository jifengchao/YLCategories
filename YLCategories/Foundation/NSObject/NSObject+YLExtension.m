//
//  NSObject+YLExtension.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSObject+YLExtension.h"

@implementation NSObject (YLExtension)

/** 当前时刻*/
- (CFAbsoluteTime)yl_currentRunTime {
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    return start;
}

/** 清除启动图缓存 */
- (void)yl_clearSnapshots {
    NSString *path0 = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SplashBoard"];
    if ([[NSFileManager defaultManager] isExecutableFileAtPath:path0]) {   // 清除
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:path0 error:&error];
    }
    
    NSString *path1 = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Snapshots"];
    if ([[NSFileManager defaultManager] isExecutableFileAtPath:path1]) {   // 清除
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:path1 error:&error];
    }
}

/** 对象的引用计数值*/
- (NSInteger)yl_retainCount {
    id obj = self;
    long count = CFGetRetainCount((__bridge CFTypeRef)(obj));
    return count;
}

@end
