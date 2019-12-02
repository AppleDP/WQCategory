//
//  UIDevice+WQExtension.m
//  WQCategory
//
//  Created by iOS on 2019/1/11.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <netdb.h>
#import <net/if.h>
#include <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/utsname.h>
#import "UIDevice+WQExtension.h"

@implementation UIDevice (WQExtension)
+ (WQPhoneModel)wq_myPhoneModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // iPhone
    if ([deviceString isEqualToString:@"iPhone3,1"]) return iPhone4; // iPhone 4
    if ([deviceString isEqualToString:@"iPhone3,2"]) return iPhone4; // iPhone 4
    if ([deviceString isEqualToString:@"iPhone3,3"]) return iPhone4; // iPhone 4
    if ([deviceString isEqualToString:@"iPhone4,1"]) return iPhone4s; // iPhone 4S
    if ([deviceString isEqualToString:@"iPhone5,1"]) return iPhone5; // iPhone 5
    if ([deviceString isEqualToString:@"iPhone5,2"]) return iPhone5; // iPhone 5 (GSM+CDMA)
    if ([deviceString isEqualToString:@"iPhone5,3"]) return iPhone5c; // iPhone 5c (GSM)
    if ([deviceString isEqualToString:@"iPhone5,4"]) return iPhone5c; // iPhone 5c (GSM+CDMA)
    if ([deviceString isEqualToString:@"iPhone6,1"]) return iPhone5s; // iPhone 5s (GSM)
    if ([deviceString isEqualToString:@"iPhone6,2"]) return iPhone5s; // iPhone 5s (GSM+CDMA)
    if ([deviceString isEqualToString:@"iPhone7,1"]) return iPhone6P; // iPhone 6 Plus
    if ([deviceString isEqualToString:@"iPhone7,2"]) return iPhone6; // iPhone 6
    if ([deviceString isEqualToString:@"iPhone8,1"]) return iPhone6s;// iPhone 6s
    if ([deviceString isEqualToString:@"iPhone8,2"]) return iPhone6sP; // iPhone 6s Plus
    if ([deviceString isEqualToString:@"iPhone8,4"]) return iPhoneSE; // iPhone SE
    if ([deviceString isEqualToString:@"iPhone9,1"]) return iPhone7; // iPhone 7
    if ([deviceString isEqualToString:@"iPhone9,2"]) return iPhone7P; // iPhone 7 Plus
    if ([deviceString isEqualToString:@"iPhone10,1"] || [deviceString isEqualToString:@"iPhone10,4"]) return iPhone8; // iPhone 8
    if ([deviceString isEqualToString:@"iPhone10,2"] || [deviceString isEqualToString:@"iPhone10,5"]) return iPhone8P; // iPhone 8 Plus
    if ([deviceString isEqualToString:@"iPhone10,3"] || [deviceString isEqualToString:@"iPhone10,6"]) return iPhoneX; // iPhone X
    if ([deviceString isEqualToString:@"iPhone11,2"]) return iPhoneXS; // iPhone XS
    if ([deviceString isEqualToString:@"iPhone11,4"] || [deviceString isEqualToString:@"iPhone11,6"]) return iPhoneXSMax; // iPhone XS Max
    if ([deviceString isEqualToString:@"iPhone11,8"]) return iPhoneXR; // iPhone XR
    if ([deviceString isEqualToString:@"iPhone12,1"]) return iPhone11; // iPhone 11
    if ([deviceString isEqualToString:@"iPhone12,3"]) return iPhone11Pro; // iPhone 11 Pro
    if ([deviceString isEqualToString:@"iPhone12,5"]) return iPhone11ProMax; // iPhone 11 Pro Max
    
    // iPod
    if ([deviceString isEqualToString:@"iPod1,1"]) return iPodTouch; // iPod touch
    if ([deviceString isEqualToString:@"iPod2,1"]) return iPodTouch2G; // iPod touch 2G
    if ([deviceString isEqualToString:@"iPod3,1"]) return iPodTouch3G; // iPod touch 3G
    if ([deviceString isEqualToString:@"iPod4,1"]) return iPodTouch4G; // iPod touch 4G
    if ([deviceString isEqualToString:@"iPod5,1"]) return iPodTouch5G; // iPod touch 5G
    if ([deviceString isEqualToString:@"iPod7,1"]) return iPodTouch6G; // iPod touch 6G
    
    // iPad
    if ([deviceString isEqualToString:@"iPad1,1"]) return iPad; // iPad
    if ([deviceString isEqualToString:@"iPad1,2"]) return iPad3G; // iPad 3G
    if ([deviceString isEqualToString:@"iPad2,1"] || [deviceString isEqualToString:@"iPad2,2"] || [deviceString isEqualToString:@"iPad2,3"] || [deviceString isEqualToString:@"iPad2,4"]) return iPad2; // iPad 2
    if ([deviceString isEqualToString:@"iPad3,1"] || [deviceString isEqualToString:@"iPad3,2"] || [deviceString isEqualToString:@"iPad3,3"]) return iPad3; // iPad 3
    if ([deviceString isEqualToString:@"iPad3,4"] || [deviceString isEqualToString:@"iPad3,5"] || [deviceString isEqualToString:@"iPad3,6"]) return iPad4; // iPad 4
    if ([deviceString isEqualToString:@"iPad4,1"] || [deviceString isEqualToString:@"iPad4,2"] || [deviceString isEqualToString:@"iPad4,3"]) return iPadAir; // iPad Air
    if ([deviceString isEqualToString:@"iPad5,3"] || [deviceString isEqualToString:@"iPad5,4"]) return iPadAir2; // iPad Air 2
    if ([deviceString isEqualToString:@"iPad6,7"] || [deviceString isEqualToString:@"iPad6,8"]) return iPadPro12_9Inch; // iPad Pro 12.9-inch
    if ([deviceString isEqualToString:@"iPad6,3"] || [deviceString isEqualToString:@"iPad6,4"]) return iPadPro9_7Inch; // iPad Pro iPad 9.7-inch
    if ([deviceString isEqualToString:@"iPad6,11"] || [deviceString isEqualToString:@"iPad6,12"]) return iPad5; // iPad 5
    if ([deviceString isEqualToString:@"iPad7,1"] || [deviceString isEqualToString:@"iPad7,2"]) return iPadPro12_9Inch2; // iPad Pro 12.9-inch 2
    if ([deviceString isEqualToString:@"iPad7,3"] || [deviceString isEqualToString:@"iPad7,4"]) return iPadPro10_5Inch; // iPad Pro 10.5-inch
    if ([deviceString isEqualToString:@"iPad2,5"] || [deviceString isEqualToString:@"iPad2,6"] || [deviceString isEqualToString:@"iPad2,7"]) return iPadMini; // iPad mini
    if ([deviceString isEqualToString:@"iPad4,4"] || [deviceString isEqualToString:@"iPad4,5"] || [deviceString isEqualToString:@"iPad4,6"]) return iPadMini2; // iPad mini 2
    if ([deviceString isEqualToString:@"iPad4,7"] || [deviceString isEqualToString:@"iPad4,8"] || [deviceString isEqualToString:@"iPad4,9"]) return iPadMini3; // iPad mini 3
    if ([deviceString isEqualToString:@"iPad5,1"] || [deviceString isEqualToString:@"iPad5,2"]) return iPadMini4; // iPad mini 4
    if ([deviceString isEqualToString:@"i386"]) return Simulator; // Simulator
    if ([deviceString isEqualToString:@"x86_64"]) return Simulator; // Simulator
    return Unknown;
}

+ (nullable NSString *)wq_getIpAddress {
    NSString *address;
    BOOL useIPv6 = NO;
#if TARGET_OS_IPHONE
#if !TARGET_IPHONE_SIMULATOR && !TARGET_OS_TV
    const char* primaryInterface = "en0";
#endif
#else
    const char* primaryInterface = NULL;
    SCDynamicStoreRef store = SCDynamicStoreCreate(kCFAllocatorDefault, CFSTR("GCDWebServer"), NULL, NULL);
    if (store) {
        CFPropertyListRef info = SCDynamicStoreCopyValue(store, CFSTR("State:/Network/Global/IPv4"));
        if (info) {
            NSString* interface = [(__bridge NSDictionary*)info objectForKey:@"PrimaryInterface"];
            if (interface) {
                primaryInterface = [[NSString stringWithString:interface] UTF8String];
            }
            CFRelease(info);
        }
        CFRelease(store);
    }
    if (primaryInterface == NULL) {
        primaryInterface = "lo0";
    }
#endif
    struct ifaddrs* list;
    if (getifaddrs(&list) >= 0) {
        for (struct ifaddrs* ifap = list; ifap; ifap = ifap->ifa_next) {
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_TV
            if (strcmp(ifap->ifa_name, "en0") && strcmp(ifap->ifa_name, "en1"))
#else
                if (strcmp(ifap->ifa_name, primaryInterface))
#endif
                {
                    continue;
                }
            if ((ifap->ifa_flags & IFF_UP) && ((!useIPv6 && (ifap->ifa_addr->sa_family == AF_INET)) || (useIPv6 && (ifap->ifa_addr->sa_family == AF_INET6)))) {
                char hostBuffer[NI_MAXHOST];
                char serviceBuffer[NI_MAXSERV];
                const struct sockaddr* addr = ifap->ifa_addr;
                if (getnameinfo(addr, addr->sa_len, hostBuffer, sizeof(hostBuffer), serviceBuffer, sizeof(serviceBuffer), NI_NUMERICHOST | NI_NUMERICSERV | NI_NOFQDN) != 0) {
                    return address;
                }
                address = (NSString*)[NSString stringWithUTF8String:hostBuffer];
                break;
            }
        }
        freeifaddrs(list);
    }
    return address;
}

+ (nullable NSString *)wq_getSubnet {
    NSString *subnet;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    subnet = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return subnet;
}
@end
