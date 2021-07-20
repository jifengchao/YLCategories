#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YLCategories.h"
#import "YLCoreLocation.h"
#import "CLLocation+YLConvert.h"
#import "YLFoundation.h"
#import "NSArray+YLExtension.h"
#import "NSArray+YLSafe.h"
#import "NSDictionary+YLExtension.h"
#import "NSDictionary+YLSafe.h"
#import "NSFileManager+YLFile.h"
#import "NSObject+YLDebounce.h"
#import "NSObject+YLExtension.h"
#import "NSObject+YLPermission.h"
#import "NSObject+YLProperty.h"
#import "NSString+YLCharLength.h"
#import "NSString+YLExtension.h"
#import "NSString+YLFilePath.h"
#import "NSString+YLJsonString.h"
#import "NSString+YLRegex.h"
#import "NSString+YLTextSize.h"
#import "NSURL+YLParams.h"
#import "YLUIKit.h"
#import "UIApplication+YLCall.h"
#import "UIButton+YLAlignment.h"
#import "UIButton+YLBlock.h"
#import "UIButton+YLCountDown.h"
#import "UIButton+YLExtension.h"
#import "UIButton+YLMake.h"
#import "UIImage+YLCircled.h"
#import "UIImage+YLCompress.h"
#import "UIImage+YLExtension.h"
#import "UIImage+YLQR.h"
#import "UIImageView+YLCornerRadius.h"
#import "UILabel+YLAttributed.h"
#import "UILabel+YLMake.h"
#import "UINavigationBar+YLHairline.h"
#import "UIPasteboard+YLExtension.h"
#import "UITextField+YLDelegate.h"
#import "UITextField+YLLimitLength.h"
#import "UITextField+YLMake.h"
#import "UITextField+YLPlaceholder.h"
#import "UITextView+YLMake.h"
#import "UITextView+YLPlaceholder.h"
#import "UIView+YLBlockGesture.h"
#import "UIView+YLCorner.h"
#import "UIView+YLFrame.h"
#import "UIView+YLMake.h"
#import "UIView+YLVisualEffect.h"
#import "UIViewController+YLAlert.h"
#import "UIViewController+YLExtension.h"

FOUNDATION_EXPORT double YLCategoriesVersionNumber;
FOUNDATION_EXPORT const unsigned char YLCategoriesVersionString[];

