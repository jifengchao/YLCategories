//
//  NSURL+YLParams.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSURL (YLParams)

/** 将url里面的参数转换成字典*/
- (NSDictionary *)yl_getParams;

+ (NSDictionary *)yl_getParamsWithURL:(NSURL *)url;

/** 取url里面的路径地址(不含参数)*/
- (NSString *)yl_getPath;

+ (NSString *)yl_getPath:(NSURL *)url;

- (NSString *)yl_valueForParameter:(NSString *)parameterKey;

@end
