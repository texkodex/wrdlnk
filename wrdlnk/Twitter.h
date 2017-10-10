//
//  Twitter.h
//  wrdlnk
//
//  Created by sparkle on 10/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

#ifndef Twitter_h
#define Twitter_h

#import <TwitterCore/TwitterCore.h>
#import <TwitterKit/TwitterKit.h>

#if !defined(__has_include)
#error "Twitter.h won't import anything if your compiler doesn't support __has_include. Please \
import the headers individually."
#else
#if __has_include(<TwitterCore/TwitterCore.h>)
#import <TwitterCore/TwitterCore.h>
#endif

#if __has_include(<TwitterKit/TwitterKit.h>)
#import <TwitterKit/TwitterKit.h>
#endif

#endif  // defined(__has_include)


#endif /* Twitter_h */
