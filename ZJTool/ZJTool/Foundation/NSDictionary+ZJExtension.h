//
//  NSDictionary+ZJExtension.h
//  ZJTool
//
//  Created by zhujia on 2019/7/22.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSON)

/*
 * JSON解析
 * @return 字典
 */

- (NSString *)zj_JSONString;

@end

@interface NSDictionary (ZJExtension)

/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString*) zj_URLQueryStringWithSortedKeys:(BOOL) sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSString*) zj_URLQueryString;

@end

NS_ASSUME_NONNULL_END
