//
//  NSURL+YLParams.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSURL+YLParams.h"

@implementation NSURL (YLParams)

/** 将url里面的参数转换成字典*/
- (NSDictionary *)yl_getParams {
    return [NSURL yl_getParamsWithURL:self];
}

+ (NSDictionary *)yl_getParamsWithURL:(NSURL *)url {
    if (!url) return nil;
    /*
     query是？后面的参数
     例如 title=hello&content=helloworld&urlschemes=shixueqian
     */
    NSString *query = url.query;
    query = [query stringByRemovingPercentEncoding]; // 解码
    
    // 进行字符串的拆分，通过&来拆分，把每个参数分开
    NSArray *subArray = [query componentsSeparatedByString:@"&"];
    // 把subArray转换为字典
    // tempDic中存放一个URL中转换的键值对
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    for (int i = 0 ; i < subArray.count ; i++) {
        // 通过“=”拆分键和值
        NSArray *dicArray = [subArray[i] componentsSeparatedByString:@"="]
        ;
        if (dicArray.count >= 2) {
            // 给字典加入元素,=前面为key，后面为value
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
        }
    }
    // 返回转换后的字典
    return tempDic;
}

/** 取url里面的路径地址(不含参数)*/
- (NSString *)yl_getPath {
    return [NSURL yl_getPath:self];
}

+ (NSString *)yl_getPath:(NSURL *)url {
    if (!url) return nil;
    NSString *path = url.absoluteString;
    NSString *query = url.query;
    if (query.length == 0 ||
        [path rangeOfString:query].location == NSNotFound) {
        return path;
    } else {
        NSRange range = [path rangeOfString:query];
        path = [path substringToIndex:range.location];
        if ([path hasSuffix:@"?"] || [path hasSuffix:@"？"]) {
            path = [path substringToIndex:(path.length - 1)];
        }
        return path;
    }
}

- (NSString *)yl_valueForParameter:(NSString *)parameterKey {
    return [[self yl_getParams] objectForKey:parameterKey];
}

@end
