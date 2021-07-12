//
//  NSObject+YLPermission.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (YLPermission)

/**
*  1.2联网权限-获取
*/
- (void)yl_getNetWorkPemission;


/**
 *  2.1相机权限-检测
 */
- (BOOL)yl_hasCameraPemission;

/**
 *  2.2相机权限-获取
 */
- (void)yl_getCameraPemission;


/**
 *  3.1相册权限-检测
 */
- (BOOL)yl_hasPhotoLibraryPemission;

/**
 *  3.2相册权限-获取
 */
- (void)yl_getPhotoLibraryPemission;


/**
 *  4.1麦克风权限-检测
 */
- (BOOL)yl_hasMicrophonePemission;

/**
 *  4.2麦克风权限-获取
 */
- (void)yl_getMicrophonePemission;


/**
 *  5.1定位权限-检测
 */
- (BOOL)yl_hasLocationPemission;

/**
 *  5.2定位权限-获取
 */
- (void)yl_getLocationPemission;


/**
 *  6.1推送权限-检测
 */
- (BOOL)yl_hasNotificationPemission;

/**
 *  6.2推送权限-获取
 */
- (void)yl_getNotificationPemission;


/**
 *  7.1通讯录权限-检测
 */
- (BOOL)yl_hasAddressBookPemission;

/**
 *  7.2通讯录权限-获取
 */
- (void)yl_getAddressBookPemission;


/**
 *  8.1日历权限-检测
 */
- (BOOL)yl_hasCalendarPemission;

/**
 *  8.2日历权限-获取
 */
- (void)yl_getCalendarPemission;


/**
 *  9.1备忘录权限-检测
 */
- (BOOL)yl_hasMemorandumBookPemission;

/**
 *  9.2备忘录权限-获取
 */
- (void)yl_getMemorandumBookPemission;


@end
