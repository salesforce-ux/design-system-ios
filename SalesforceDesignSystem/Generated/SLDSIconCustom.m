/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSIconCustom.h"

#define iconUniCode(enum) [@[\
@"\uEA01",\
@"\uEA02",\
@"\uEA03",\
@"\uEA04",\
@"\uEA05",\
@"\uEA06",\
@"\uEA07",\
@"\uEA08",\
@"\uEA09",\
@"\uEA0A",\
@"\uEA0B",\
@"\uEA0C",\
@"\uEA0D",\
@"\uEA0E",\
@"\uEA0F",\
@"\uEA10",\
@"\uEA11",\
@"\uEA12",\
@"\uEA13",\
@"\uEA14",\
@"\uEA15",\
@"\uEA16",\
@"\uEA17",\
@"\uEA18",\
@"\uEA19",\
@"\uEA1A",\
@"\uEA1B",\
@"\uEA1C",\
@"\uEA1D",\
@"\uEA1E",\
@"\uEA1F",\
@"\uEA20",\
@"\uEA21",\
@"\uEA22",\
@"\uEA23",\
@"\uEA24",\
@"\uEA25",\
@"\uEA26",\
@"\uEA27",\
@"\uEA28",\
@"\uEA29",\
@"\uEA2A",\
@"\uEA2B",\
@"\uEA2C",\
@"\uEA2D",\
@"\uEA2E",\
@"\uEA2F",\
@"\uEA30",\
@"\uEA31",\
@"\uEA32",\
@"\uEA33",\
@"\uEA34",\
@"\uEA35",\
@"\uEA36",\
@"\uEA37",\
@"\uEA38",\
@"\uEA39",\
@"\uEA3A",\
@"\uEA3B",\
@"\uEA3C",\
@"\uEA3D",\
@"\uEA3E",\
@"\uEA3F",\
@"\uEA40",\
@"\uEA41",\
@"\uEA42",\
@"\uEA43",\
@"\uEA44",\
@"\uEA45",\
@"\uEA46",\
@"\uEA47",\
@"\uEA48",\
@"\uEA49",\
@"\uEA4A",\
@"\uEA4B",\
@"\uEA4C",\
@"\uEA4D",\
@"\uEA4E",\
@"\uEA4F",\
@"\uEA50",\
@"\uEA51",\
@"\uEA52",\
@"\uEA53",\
@"\uEA54",\
@"\uEA55",\
@"\uEA56",\
@"\uEA57",\
@"\uEA58",\
@"\uEA59",\
@"\uEA5A",\
@"\uEA5B",\
@"\uEA5C",\
@"\uEA5D",\
@"\uEA5E",\
@"\uEA5F",\
@"\uEA60",\
@"\uEA61",\
@"\uEA62",\
@"\uEA63",\
@"\uEA64" \
] objectAtIndex:enum]


@implementation SLDSIconCustom

static float const colors[][3] = {
    {1,0.482,0.518},
{0.392,0.533,0.89},
{0.882,0.365,0.463},
{0.529,0.518,0.918},
{0.863,0.443,0.82},
{0.875,0.38,0.518},
{0.235,0.761,0.702},
{0.969,0.494,0.459},
{0.914,0.686,0.404},
{0.675,0.827,0.376},
{0.302,0.792,0.463},
{0.227,0.745,0.694},
{0.812,0.816,0.361},
{0.282,0.78,0.784},
{0.541,0.478,0.929},
{0.545,0.522,0.976},
{0.69,0.439,0.902},
{0.898,0.404,0.596},
{0.894,0.435,0.745},
{0.463,0.596,0.941},
{0.353,0.69,0.824},
{0.537,0.753,0.349},
{0.741,0.824,0.373},
{0.925,0.706,0.424},
{0.961,0.624,0.443},
{0.922,0.408,0.498},
{0.22,0.765,0.576},
{0.592,0.812,0.365},
{0.835,0.541,0.416},
{0.914,0.388,0.494},
{0.831,0.447,0.831},
{0.549,0.537,0.949},
{0.325,0.714,0.843},
{0.31,0.745,0.459},
{0.882,0.851,0.318},
{0.514,0.78,0.369},
{0.263,0.71,0.71},
{0.812,0.816,0.357},
{0.498,0.576,0.976},
{0.784,0.792,0.345},
{0.851,0.345,0.475},
{0.404,0.647,0.906},
{0.373,0.8,0.392},
{0.937,0.412,0.498},
{0.886,0.361,0.502},
{0.624,0.859,0.4},
{0.286,0.737,0.827},
{0.847,0.78,0.376},
{0.933,0.557,0.435},
{0.953,0.431,0.514},
{0.918,0.439,0.694},
{0.839,0.431,0.878},
{0.443,0.553,0.922},
{0.353,0.612,0.867},
{0.204,0.71,0.616},
{0.89,0.816,0.404},
{0.329,0.769,0.451},
{0.749,0.353,0.533},
{0.961,0.451,0.463},
{0.42,0.573,0.863},
{0.486,0.812,0.376},
{0.38,0.561,0.847},
{0.949,0.475,0.671},
{0.847,0.745,0.373},
{0.973,0.49,0.463},
{0.949,0.412,0.475},
{0.929,0.388,0.529},
{0.416,0.537,0.898},
{0.906,0.412,0.706},
{0.89,0.431,0.89},
{0.553,0.608,0.984},
{0.404,0.62,0.941},
{0.255,0.784,0.627},
{0.804,0.624,0.396},
{0.859,0.427,0.478},
{0.71,0.365,0.357},
{0.353,0.584,0.867},
{0.557,0.827,0.388},
{0.314,0.808,0.725},
{0.396,0.604,0.835},
{0.855,0.384,0.498},
{0.82,0.357,0.592},
{0.906,0.502,0.435},
{0.965,0.439,0.482},
{0.949,0.408,0.569},
{0.886,0.376,0.671},
{0.847,0.463,0.898},
{0.6,0.435,0.902},
{0.243,0.6,0.745},
{0.42,0.62,0.886},
{0.133,0.643,0.541},
{0.749,0.482,0.4},
{0.318,0.494,0.51},
{0.565,0.302,0.298},
{0.263,0.612,0.729},
{0.545,0.812,0.416},
{0.427,0.616,0.89},
{0.867,0.376,0.522},
{0.882,0.745,0.361},
{0.941,0.522,0.431}
};

+ (NSString *)sldsIconUniCode:(SLDSIconCustomType)icon{
    return iconUniCode(icon);
}

+ (UIColor *)bgColor:(SLDSIconCustomType)icon{
    if(colors[icon][0]<0 || colors[icon][1]<0 || colors[icon][2]<0){
        return nil;
    }
    return [UIColor colorWithRed:colors[icon][0] green:colors[icon][1] blue:colors[icon][2] alpha:1];
}

@end
