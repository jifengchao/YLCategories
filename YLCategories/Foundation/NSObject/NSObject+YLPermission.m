//
//  NSObject+YLPermission.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

/*
 前提得在Info.plist文件中申明相关权限的说明
 */

#import "NSObject+YLPermission.h"

@import AVFoundation;
@import Photos;
@import CoreLocation;
@import Contacts;
@import EventKit;

@implementation NSObject (YLPermission)

/**
 *  1.2联网权限-获取
 */
- (void)yl_getNetWorkPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"无线数据"];
}

/**
 *  2.1相机权限-检测
 */
- (BOOL)yl_hasCameraPemission {
    BOOL hasPemission = NO;
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        switch (permission) {
                case AVAuthorizationStatusAuthorized:
                    hasPemission = YES;
                    break;
                case AVAuthorizationStatusDenied:
                case AVAuthorizationStatusRestricted:
                    break;
                case AVAuthorizationStatusNotDetermined:
                    hasPemission = YES;
                    break;
        }
    }
    
    return hasPemission;
}

/**
 *  2.2相机权限-获取
 */
- (void)yl_getCameraPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"相机"];
}


/**
 *  3.1相册权限-检测
 */
- (BOOL)yl_hasPhotoLibraryPemission {
    BOOL hasPemission = NO;
    
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    switch (photoAuthorStatus) {
            case PHAuthorizationStatusAuthorized:
                hasPemission = YES;
                break;
            case PHAuthorizationStatusRestricted:
            case PHAuthorizationStatusDenied:
                hasPemission = NO;
                break;
            case PHAuthorizationStatusNotDetermined:
                hasPemission = YES;
                break;
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  3.2相册权限-获取
 */
- (void)yl_getPhotoLibraryPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"相册"];
}


/**
 *  4.1麦克风权限-检测
 */
- (BOOL)yl_hasMicrophonePemission {
    BOOL hasPemission = NO;
    
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];//麦克风权限
    
    switch (AVstatus) {
            case AVAuthorizationStatusAuthorized:
                NSLog(@"Authorized");
                hasPemission = YES;
                break;
            case AVAuthorizationStatusRestricted:
            case AVAuthorizationStatusDenied:
                NSLog(@"Denied");
            break;
            case AVAuthorizationStatusNotDetermined:
                NSLog(@"not Determined");
                hasPemission = YES;
                break;
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  4.2麦克风权限-获取
 */
- (void)yl_getMicrophonePemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"麦克风"];
}


/**
 *  5.1定位权限-检测
 */
- (BOOL)yl_hasLocationPemission {
    BOOL hasPemission = NO;
    
    CLAuthorizationStatus CLstatus = [CLLocationManager authorizationStatus];
    switch (CLstatus) {
            case kCLAuthorizationStatusAuthorizedAlways:
                hasPemission = YES;
                break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                hasPemission = YES;
                break;
            case kCLAuthorizationStatusRestricted:
            case kCLAuthorizationStatusDenied:
                break;
            case kCLAuthorizationStatusNotDetermined:
                hasPemission = YES;
                break;
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  5.2定位权限-获取
 */
- (void)yl_getLocationPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"定位"];
}


/**
 *  6.1推送权限-检测
 */
- (BOOL)yl_hasNotificationPemission {
    BOOL hasPemission = NO;
    
    UIUserNotificationSettings *settings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    switch (settings.types) {
            case UIUserNotificationTypeNone:
                break;
            case UIUserNotificationTypeBadge:
            case UIUserNotificationTypeAlert:
            case UIUserNotificationTypeSound:
                hasPemission = YES;
                break;
            
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  6.2推送权限-获取
 */
- (void)yl_getNotificationPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"通知"];
}


/**
 *  7.1通讯录权限-检测 只支持ios9
 */
- (BOOL)yl_hasAddressBookPemission {
    __block BOOL hasPemission = NO;
    
    CNAuthorizationStatus authStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    switch (authStatus) {
        case CNAuthorizationStatusAuthorized:
            hasPemission = YES;
            break;
        case CNAuthorizationStatusDenied: {
            hasPemission = NO;
        }
            break;
        case CNAuthorizationStatusNotDetermined: {
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                hasPemission = granted;
            }];
        }
            break;
        case CNAuthorizationStatusRestricted:
            hasPemission = NO;
            break;
    }
    
    return hasPemission;
}

/**
 *  7.2通讯录权限-获取
 */
- (void)yl_getAddressBookPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"通讯录"];
}


/**
 *  8.1日历权限-检测
 */
- (BOOL)yl_hasCalendarPemission {
    /**
     typedef NS_ENUM(NSUInteger, EKEntityType) {
     EKEntityTypeEvent,//日历
     EKEntityTypeReminder //备忘
     };
     */
    
    BOOL hasPemission = NO;
    
    EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeEvent];
    switch (EKstatus) {
            case EKAuthorizationStatusAuthorized:
                hasPemission = YES;
                break;
            case EKAuthorizationStatusRestricted:
            case EKAuthorizationStatusDenied:
                break;
            case EKAuthorizationStatusNotDetermined:
                hasPemission = YES;
                break;
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  8.2日历权限-获取
 */
- (void)yl_getCalendarPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"日历"];
}


/**
 *  9.1备忘录权限-检测
 */
- (BOOL)yl_hasMemorandumBookPemission {
    BOOL hasPemission = NO;
    
    EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeReminder];
    switch (EKstatus) {
            case EKAuthorizationStatusAuthorized:
                hasPemission = YES;
                break;
            case EKAuthorizationStatusRestricted:
            case EKAuthorizationStatusDenied:
                break;
            case EKAuthorizationStatusNotDetermined:
                hasPemission = YES;
                break;
        default:
            break;
    }
    
    return hasPemission;
}

/**
 *  9.2备忘录权限-获取
 */
- (void)yl_getMemorandumBookPemission {
    [self yl_showGetPemissionAlertControllerWithPemissionName:@"备忘录"];
}

/** 权限缺失提示*/
- (void)yl_showGetPemissionAlertControllerWithPemissionName:(NSString *)pemissionName {
    
    NSString *appDisplayName = [[self class] __appDisplayName];
    
    NSString *title = [NSString stringWithFormat:@"%@权限已关闭", pemissionName];
    NSString *message = [NSString stringWithFormat:@"请到设置->隐私->%@中开启【%@】%@，以便%@能够使用您的%@", pemissionName, appDisplayName, pemissionName, appDisplayName, pemissionName];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:cancelAction];
    
    UIAlertAction *setAction = [UIAlertAction actionWithTitle:@"设置" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    [alert addAction:setAction];
    
    alert.modalPresentationStyle = UIModalPresentationFullScreen;
    [[[self class] __showFromVc] presentViewController:alert animated:YES completion:nil];
}

#pragma mark private methods

+ (UIViewController *)__showFromVc {
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

+ (NSString *)__appDisplayName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appDisplayName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!appDisplayName.length) {
        appDisplayName = [infoDictionary objectForKey:@"CFBundleName"];
    }
    return appDisplayName;
}

@end
