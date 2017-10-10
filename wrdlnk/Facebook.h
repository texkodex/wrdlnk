//
//  Facebook.h
//  wrdlnk
//
//  Created by sparkle on 10/7/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

#ifndef Facebook_h
#define Facebook_h

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

#if !defined(__has_include)
#error "Facebook.h won't import anything if your compiler doesn't support __has_include. Please \
import the headers individually."
#else
#if __has_include(<FBSDKCoreKit/FBSDKCoreKit.h>)
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#endif

#if __has_include(<FBSDKLoginKit/FBSDKLoginKit.h>)
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#endif

#if __has_include(<FBSDKShareKit/FBSDKShareKit.h>)
#import <FBSDKShareKit/FBSDKShareKit.h>
#endif

#endif  // defined(__has_include)


#endif /* Facebook_h */

