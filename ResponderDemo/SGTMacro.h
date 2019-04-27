//
//  SGTMacro.h
//  ResponderDemo
//
//  Created by 邵广涛 on 2019/4/26.
//  Copyright © 2019 SGT. All rights reserved.
//

#ifndef SGTMacro_h
#define SGTMacro_h

#define SGTLog(format, ...)                  \
NSLog(@"\n%s [%s  Line:%d]\n%@\n",               \
__PRETTY_FUNCTION__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__,      \
[NSString stringWithFormat:format, ##__VA_ARGS__]);



#endif /* SGTMacro_h */
