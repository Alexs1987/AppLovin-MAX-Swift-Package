//
//  ALResourceManager.m
//  AppLovinSDK
//
//  Created by Ritam Sarmah on 11/3/21.
//  Copyright © 2021 AppLovin Corporation. All rights reserved.
//

#import "ALResourceManager.h"

#if SWIFT_PACKAGE && !(defined(SWIFTPM_MODULE_BUNDLE))

NSBundle* SWIFTPM_MODULE_BUNDLE() {
     NSString *bundleName = @"AppLovinSDK_AppLovinSDKResources";

     NSArray<NSURL*> *candidates = @[
         NSBundle.mainBundle.resourceURL,
         [NSBundle bundleForClass:[ALResourceManager class]].resourceURL,
         NSBundle.mainBundle.bundleURL
     ];

     for (NSURL* candiate in candidates) {
         NSURL *bundlePath = [candiate URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle", bundleName]];

         NSBundle *bundle = [NSBundle bundleWithURL:bundlePath];
         if (bundle != nil) {
             return bundle;
         }
     }

     @throw [[NSException alloc] initWithName:@"SwiftPMResourcesAccessor" reason:[NSString stringWithFormat:@"unable to find bundle named %@", bundleName] userInfo:nil];
 }

 #define SWIFTPM_MODULE_BUNDLE SWIFTPM_MODULE_BUNDLE()

 #endif

@implementation ALResourceManager

static NSURL *ALResourceBundleURL;

+ (void)initialize
{
    [super initialize];
    
    ALResourceBundleURL = [SWIFTPM_MODULE_BUNDLE URLForResource: @"AppLovinSDKResources" withExtension: @"bundle"];
}

+ (NSURL *)resourceBundleURL
{
    return ALResourceBundleURL;
}

@end
