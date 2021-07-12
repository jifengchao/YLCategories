//
//  NSString+YLFilePath.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSString+YLFilePath.h"

@implementation NSString (YLFilePath)

/**
 *  快速返回沙盒中，Documents文件的路径
 *
 *  @return Documents文件的路径
 */
+ (NSString *)yl_pathForDocuments {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回Documents文件中某个子文件的路径
 *
 *  @param fileName 子文件名称
 *
 *  @return 快速返回Documents文件中某个子文件的路径
 */
+ (NSString *)yl_filePathAtDocumentsWithFileName:(NSString *)fileName {
    return  [[self yl_pathForDocuments] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中，Library文件的路径
 *
 *  @return Library文件的路径
 */
+ (NSString *)yl_pathForLibrary {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回Library文件中某个子文件的路径
 *
 *  @param fileName 子文件名称
 *
 *  @return 快速返回Library文件中某个子文件的路径
 */
+ (NSString *)yl_filePathAtLibraryWithFileName:(NSString *)fileName {
    return  [[self yl_pathForLibrary] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中Library下Caches文件的路径
 *
 *  @return 快速返回沙盒中Library下Caches文件的路径
 */
+ (NSString *)yl_pathForCaches {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)yl_filePathAtCachesWithFileName:(NSString *)fileName {
    return [[self yl_pathForCaches] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回MainBundle(资源捆绑包的)的路径
 *
 *  @return 快速返回MainBundle(资源捆绑包的)的路径
 */
+ (NSString *)yl_pathForMainBundle {
    return [NSBundle mainBundle].bundlePath;
}

/**
 *  快速返回MainBundle(资源捆绑包的)下文件的路径
 *
 *  @param fileName MainBundle(资源捆绑包的)下的文件名
 *
 *  @return 快速返回MainBundle(资源捆绑包的)下文件的路径
 */
+ (NSString *)yl_filePathAtMainBundleWithFileName:(NSString *)fileName {
    return [[self yl_pathForMainBundle] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中tmp(临时文件)文件的路径
 *
 *  @return 快速返回沙盒中tmp文件的路径
 */
+ (NSString *)yl_pathForTemp {
    return NSTemporaryDirectory();
}

/**
 *  快速返回沙盒中，temp文件中某个子文件的路径
 *
 *  @param fileName 子文件名
 *
 *  @return 快速返回temp文件中某个子文件的路径
 */
+ (NSString *)yl_filePathAtTempWithFileName:(NSString *)fileName {
    return [[self yl_pathForTemp] stringByAppendingPathComponent:fileName];
}

/**
 *  快速返回沙盒中，Library下Preferences文件的路径
 *
 *  @return 快速返回沙盒中Library下Caches文件的路径
 */
+ (NSString *)yl_pathForPreferences {
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回沙盒中，Library下Preferences文件中某个子文件的路径
 *
 *  @param fileName 子文件名称
 *
 *  @return 快速返回Preferences文件中某个子文件的路径
 */
+ (NSString *)yl_filePathAtPreferencesWithFileName:(NSString *)fileName {
    return [[self yl_pathForPreferences] stringByAppendingPathComponent:fileName];
}

/**
 *  快速你指定的系统文件的路径
 *
 *  @param directory NSSearchPathDirectory枚举
 *
 *  @return 快速你指定的系统文件的路径
 */
+ (NSString *)yl_pathForSystemFile:(NSSearchPathDirectory)directory {
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) lastObject];
}

/**
 *  快速返回沙盒中，你指定的系统文件的中某个子文件的路径。tmp文件除外，请使用filePathAtTempWithFileName
 *
 *  @param directory 你指的的系统文件
 *  @param fileName  子文件名
 *
 *  @return 快速返回沙盒中，你指定的系统文件的中某个子文件的路径
 */
+ (NSString *)yl_filePathForSystemFile:(NSSearchPathDirectory)directory withFileName:(NSString *)fileName {
    return [[self yl_pathForSystemFile:directory] stringByAppendingPathComponent:fileName];
}

@end
