//
//  OESMSSystemResponder.m
//  OpenEmu
//
//  Created by Remy Demarest on 23/04/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "OESMSSystemResponder.h"

NSString *OESMSButtonNameTable[] =
{
    @"OESMSButtonUp[@]",
    @"OESMSButtonDown[@]",
    @"OESMSButtonLeft[@]",
    @"OESMSButtonRight[@]",
    @"OESMSButtonA[@]",
    @"OESMSButtonB[@]",
    @"OESMSButtonStart",
    @"OESMSButtonReset",
};

@implementation OESMSSystemResponder
@dynamic client;

+ (Protocol *)gameSystemResponderClientProtocol;
{
    return @protocol(OESMSSystemResponderClient);
}

- (OEEmulatorKey)emulatorKeyForKeyIndex:(NSUInteger)index player:(NSUInteger)thePlayer
{
    return OEMakeEmulatorKey(thePlayer, index);
}

- (void)pressEmulatorKey:(OEEmulatorKey)aKey
{
    OESMSButton button = (OESMSButton)aKey.key;
    
    switch(button)
    {
        case OESMSButtonStart : [[self client] didPushStartButton]; break;
        case OESMSButtonReset : [[self client] didPushResetButton]; break;
        default :
            [[self client] didPushButton:button forPlayer:aKey.player];
            break;
    }
}

- (void)releaseEmulatorKey:(OEEmulatorKey)aKey
{
    OESMSButton button = (OESMSButton)aKey.key;
    
    switch(button)
    {
        case OESMSButtonStart : [[self client] didReleaseStartButton]; break;
        case OESMSButtonReset : [[self client] didReleaseResetButton]; break;
        default :
            [[self client] didReleaseButton:button forPlayer:aKey.player];
            break;
    }
}

@end
