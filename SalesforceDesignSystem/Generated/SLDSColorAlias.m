/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSColorAlias.h"



@implementation SLDSColorAlias



+ (UIColor *)sldsColor:(SFDS_COLOR_ALS)lmColor{

    static NSArray* aliasColors;
    static dispatch_once_t predicate = 0;

    dispatch_once(&predicate, ^{
        aliasColors = @[
[UIColor colorWithRed:0 green:0 blue:0 alpha:1],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.07],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.16],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.24],
[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.15],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.4],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.75],
[UIColor colorWithRed:1 green:1 blue:1 alpha:0.97],
[UIColor colorWithRed:1 green:1 blue:1 alpha:1],
[UIColor colorWithRed:0 green:0 blue:0 alpha:1],
[UIColor colorWithRed:0.165 green:0.58 blue:0.839 alpha:1],
[UIColor colorWithRed:0 green:0.431 blue:0.702 alpha:1],
[UIColor colorWithRed:0.71 green:0.212 blue:0.176 alpha:1],
[UIColor colorWithRed:0.902 green:0.718 blue:0.224 alpha:1],
[UIColor colorWithRed:1 green:0.624 blue:0.02 alpha:1],
[UIColor colorWithRed:0.235 green:0.239 blue:0.243 alpha:1],
[UIColor colorWithRed:0.408 green:0.424 blue:0.439 alpha:1],
[UIColor colorWithRed:0.624 green:0.667 blue:0.71 alpha:1],
[UIColor colorWithRed:0.282 green:0.361 blue:0.439 alpha:1],
[UIColor colorWithRed:0.4 green:0.471 blue:0.541 alpha:1],
[UIColor colorWithRed:0.624 green:0.667 blue:0.71 alpha:1],
[UIColor colorWithRed:0.165 green:0.255 blue:0.345 alpha:1],
[UIColor colorWithRed:0.941 green:0.945 blue:0.949 alpha:1],
[UIColor colorWithRed:0.961 green:0.965 blue:0.969 alpha:1],
[UIColor colorWithRed:0.204 green:0.286 blue:0.369 alpha:1],
[UIColor colorWithRed:0.839 green:0.506 blue:0.518 alpha:1],
[UIColor colorWithRed:0.965 green:0.894 blue:0.894 alpha:1],
[UIColor colorWithRed:0.075 green:0.486 blue:0.741 alpha:1],
[UIColor colorWithRed:0.071 green:0.431 blue:0.655 alpha:1],
[UIColor colorWithRed:0.494 green:0.549 blue:0.6 alpha:1],
[UIColor colorWithRed:0.494 green:0.549 blue:0.6 alpha:0.8],
[UIColor colorWithRed:0.322 green:0.325 blue:0.329 alpha:1],
[UIColor colorWithRed:0.145 green:0.212 blue:0.278 alpha:1],
[UIColor colorWithRed:0.145 green:0.212 blue:0.278 alpha:0.3],
[UIColor colorWithRed:0.145 green:0.212 blue:0.278 alpha:0.8],
[UIColor colorWithRed:0.941 green:0.973 blue:0.988 alpha:1],
[UIColor colorWithRed:0.941 green:0.973 blue:0.988 alpha:0.75],
[UIColor colorWithRed:0 green:0.361 blue:0.58 alpha:1],
[UIColor colorWithRed:1 green:0.941 blue:0.247 alpha:1],
[UIColor colorWithRed:0.98 green:1 blue:0.741 alpha:1],
[UIColor colorWithRed:0.753 green:0.376 blue:0.341 alpha:1],
[UIColor colorWithRed:0.263 green:0.714 blue:0.416 alpha:1],
[UIColor colorWithRed:0.969 green:0.976 blue:0.984 alpha:1],
[UIColor colorWithRed:0.024 green:0.11 blue:0.247 alpha:1],
[UIColor colorWithRed:0.024 green:0.11 blue:0.247 alpha:0.8],
[UIColor colorWithRed:0.024 green:0.11 blue:0.247 alpha:0.3],
[UIColor colorWithRed:0.086 green:0.196 blue:0.361 alpha:1],
[UIColor colorWithRed:0.165 green:0.259 blue:0.424 alpha:1],
[UIColor colorWithRed:0.329 green:0.412 blue:0.553 alpha:1],
[UIColor colorWithRed:0.329 green:0.412 blue:0.553 alpha:0.95],
[UIColor colorWithRed:0 green:0.439 blue:0.824 alpha:1],
[UIColor colorWithRed:0 green:0.373 blue:0.698 alpha:1],
[UIColor colorWithRed:0.98 green:0.98 blue:0.984 alpha:1],
[UIColor colorWithRed:0.957 green:0.965 blue:0.976 alpha:1],
[UIColor colorWithRed:0.878 green:0.898 blue:0.933 alpha:1],
[UIColor colorWithRed:0.847 green:0.867 blue:0.902 alpha:1],
[UIColor colorWithRed:0.659 green:0.718 blue:0.78 alpha:1],
[UIColor colorWithRed:0.082 green:0.537 blue:0.933 alpha:1],
[UIColor colorWithRed:0.369 green:0.706 blue:1 alpha:1],
[UIColor colorWithRed:1 green:0.604 blue:0.235 alpha:1],
[UIColor colorWithRed:1 green:0.314 blue:0.498 alpha:1],
[UIColor colorWithRed:0.761 green:0.224 blue:0.204 alpha:1],
[UIColor colorWithRed:0.761 green:0.224 blue:0.204 alpha:0.95],
[UIColor colorWithRed:0.651 green:0.102 blue:0.078 alpha:1],
[UIColor colorWithRed:0.529 green:0.02 blue:0 alpha:1],
[UIColor colorWithRed:0.004 green:0.812 blue:0.663 alpha:1],
[UIColor colorWithRed:0.294 green:0.792 blue:0.506 alpha:1],
[UIColor colorWithRed:0.851 green:1 blue:0.875 alpha:1],
[UIColor colorWithRed:0.016 green:0.518 blue:0.294 alpha:1],
[UIColor colorWithRed:0.016 green:0.518 blue:0.294 alpha:0.95],
[UIColor colorWithRed:1 green:0.718 blue:0.365 alpha:1],
[UIColor colorWithRed:0.918 green:0.51 blue:0.533 alpha:1],
[UIColor colorWithRed:1 green:0.867 blue:0.882 alpha:1],
[UIColor colorWithRed:0.831 green:0.314 blue:0.298 alpha:1],
[UIColor colorWithRed:0 green:0.224 blue:0.42 alpha:1],
[UIColor colorWithRed:0.933 green:0.945 blue:0.965 alpha:1],
[UIColor colorWithRed:0.267 green:0.267 blue:0.267 alpha:1],
[UIColor colorWithRed:0.847 green:0.929 blue:1 alpha:1],
[UIColor colorWithRed:0.31 green:0.208 blue:0.831 alpha:1],
[UIColor colorWithRed:0.278 green:0.18 blue:0.761 alpha:1],
[UIColor colorWithRed:0.239 green:0.153 blue:0.671 alpha:1],
[UIColor colorWithRed:0.2 green:0.125 blue:0.588 alpha:1],
[UIColor colorWithRed:0.173 green:0.106 blue:0.51 alpha:1],
[UIColor colorWithRed:0.922 green:0.424 blue:0.98 alpha:1],
[UIColor colorWithRed:0.886 green:0.267 blue:0.961 alpha:1],
[UIColor colorWithRed:0.851 green:0.176 blue:0.929 alpha:1],
[UIColor colorWithRed:0.765 green:0.125 blue:0.839 alpha:1],
[UIColor colorWithRed:0.671 green:0.098 blue:0.741 alpha:1],
[UIColor colorWithRed:0.961 green:0.584 blue:0.565 alpha:1],
[UIColor colorWithRed:0.91 green:0.463 blue:0.443 alpha:1],
[UIColor colorWithRed:0.839 green:0.361 blue:0.337 alpha:1],
[UIColor colorWithRed:0.753 green:0.275 blue:0.247 alpha:1],
[UIColor colorWithRed:0.584 green:0.271 blue:0.255 alpha:1],
[UIColor colorWithRed:0.976 green:0.949 blue:0.98 alpha:1],
[UIColor colorWithRed:0.949 green:0.902 blue:0.949 alpha:1],
[UIColor colorWithRed:0.875 green:0.773 blue:0.878 alpha:1],
[UIColor colorWithRed:0.792 green:0.639 blue:0.8 alpha:1],
[UIColor colorWithRed:0.686 green:0.49 blue:0.702 alpha:1],
[UIColor colorWithRed:0.584 green:0.361 blue:0.6 alpha:1],
[UIColor colorWithRed:0.486 green:0.251 blue:0.498 alpha:1],
[UIColor colorWithRed:0.384 green:0.161 blue:0.4 alpha:1],
[UIColor colorWithRed:0.286 green:0.09 blue:0.302 alpha:1],
[UIColor colorWithRed:0.192 green:0.039 blue:0.2 alpha:1],
[UIColor colorWithRed:0.518 green:0.282 blue:0 alpha:1],
[UIColor colorWithRed:0.008 green:0.502 blue:0.282 alpha:1],
[UIColor colorWithRed:0 green:0.631 blue:0.875 alpha:1],
[UIColor colorWithRed:0.875 green:0.894 blue:0.933 alpha:1],
[UIColor colorWithRed:0.043 green:0.137 blue:0.6 alpha:1]
        ];
    });
    
    return [aliasColors objectAtIndex:lmColor];
}

@end