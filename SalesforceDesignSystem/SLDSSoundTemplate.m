/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <UIKit/UIKit.h>
#import "SLDSSoundTemplate.h"

@implementation SLDSSoundTemplate


+(NSString*)SLDSSoundFileName:(SLDSSoundType) soundType {
    NSArray *arr = @[
                     @"SLDSSoundTypeLoggedIn.mp3",
                     @"SLDSSoundTypeFeedRefresh.mp3",
                     @"SLDSSoundTypePostLike.mp3",
                     @"SLDSSoundTypePostComment.mp3",
                     @"SLDSSoundTypePostNew.mp3",
                     @"SLDSSoundTypeActionOpen.mp3",
                     @"SLDSSoundTypeActionClose.mp3",
                     @"SLDSSoundTypeActionSelect.mp3",
                     @"SLDSSoundTypeNavigationOpen.mp3",
                     @"SLDSSoundTypeNavigationClose.mp3",
                     @"SLDSSoundTypeRecordTab.mp3",
                     @"SLDSSoundTypeObjectSelect.mp3",
                     @"SLDSSoundTypeSuccess.mp3",
                     @"SLDSSoundTypeError.mp3"
                     
                     ];
    return (NSString *)[arr objectAtIndex:soundType];
}

+(NSString*)SLDSSoundTypeName:(SLDSSoundType) soundType {
    NSArray *arr = @[
                     @"SLDSSoundTypeLoggedIn",
                     @"SLDSSoundTypeFeedRefresh",
                     @"SLDSSoundTypePostLike",
                     @"SLDSSoundTypePostComment",
                     @"SLDSSoundTypePostNew",
                     @"SLDSSoundTypeActionOpen",
                     @"SLDSSoundTypeActionClose",
                     @"SLDSSoundTypeActionSelect",
                     @"SLDSSoundTypeNavigationOpen",
                     @"SLDSSoundTypeNavigationClose",
                     @"SLDSSoundTypeRecordTab",
                     @"SLDSSoundTypeObjectSelect",
                     @"SLDSSoundTypeSuccess",
                     @"SLDSSoundTypeError"

                     ];
    return (NSString *)[arr objectAtIndex:soundType];
}

@end
