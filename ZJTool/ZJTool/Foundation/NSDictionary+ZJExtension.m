//
//  NSDictionary+ZJExtension.m
//  ZJTool
//
//  Created by zhujia on 2019/7/22.
//  Copyright © 2019 朱佳. All rights reserved.
//

#import "NSDictionary+ZJExtension.h"

@implementation NSDictionary (JSON)

- (NSString *)zj_JSONString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *parseError = nil;
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:0
                                                             error:&parseError];
        if(!parseError)
            return [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    }
    return @"";
}

@end


NSString *const zj_URLReservedChars     = @"￼=,!$&'()*+;@?\r\n\"<>#\t :/";
static NSString *const kQuerySeparator  = @"&";
static NSString *const kQueryDivider    = @"=";
static NSString *const kQueryBegin      = @"?";
static NSString *const kFragmentBegin   = @"#";
@implementation NSDictionary (ZJExtension)

static inline NSString *zj_URLEscape(NSString *string);

- (NSString *)zj_URLQueryString {
    return [self zj_URLQueryStringWithSortedKeys:NO];
}

- (NSString*)zj_URLQueryStringWithSortedKeys:(BOOL)sortedKeys {
    NSMutableString *queryString = @"".mutableCopy;
    NSArray *keys = sortedKeys ? [self.allKeys sortedArrayUsingSelector:@selector(compare:)] : self.allKeys;
    for (NSString *key in keys) {
        id rawValue = self[key];
        NSString *value = nil;
        // beware of empty or null
        if (!(rawValue == [NSNull null] || ![rawValue description].length)) {
            value = zj_URLEscape([self[key] description]);
        }
        [queryString appendFormat:@"%@%@%@%@",
         queryString.length ? kQuerySeparator : @"",    // appending?
         zj_URLEscape(key),
         value ? kQueryDivider : @"",
         value ? value : @""];
    }
    return queryString.length ? queryString.copy : nil;
}

static inline NSString *zj_URLEscape(NSString *string) {
    return ((__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                  NULL,
                                                                                  (__bridge CFStringRef)string,
                                                                                  NULL,
                                                                                  (__bridge CFStringRef)zj_URLReservedChars,
                                                                                  kCFStringEncodingUTF8));
}

@end
