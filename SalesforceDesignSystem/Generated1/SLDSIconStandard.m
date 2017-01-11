/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSIconStandard.h"

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
@"\uEA64",\
@"\uEA65" \
] objectAtIndex:enum]


@implementation SLDSIconStandard

static float const colors[][3] = {
    {0.498,0.553,0.882},
{0.384,0.718,0.929},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.314,0.8,0.478},
{0.235,0.592,0.867},
{0.596,0.584,0.933},
{0.949,0.812,0.357},
{0.384,0.718,0.929},
{0.722,0.765,0.808},
{0.278,0.812,0.824},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.957,0.592,0.337},
{0.957,0.592,0.337},
{0.506,0.6,0.686},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0,0.824,0.745},
{0.965,0.459,0.58},
{0.596,0.584,0.933},
{0.627,0.58,0.929},
{0.431,0.753,0.431},
{0.506,0.6,0.686},
{0.937,0.431,0.392},
{0.506,0.6,0.686},
{0.729,0.675,0.576},
{0.424,0.631,0.914},
{0.584,0.682,0.773},
{0.949,0.812,0.357},
{0.506,0.6,0.686},
{0.545,0.604,0.89},
{0.329,0.412,0.553},
{0.922,0.439,0.573},
{0.384,0.718,0.929},
{0.427,0.631,0.918},
{0.729,0.675,0.576},
{0.329,0.412,0.553},
{0.545,0.604,0.89},
{0.42,0.741,0.431},
{0.722,0.765,0.808},
{0.337,0.667,0.875},
{0.722,0.765,0.808},
{0.467,0.62,0.949},
{0.204,0.745,0.804},
{0.937,0.494,0.678},
{0,0.686,0.627},
{0.925,0.58,0.929},
{0.294,0.753,0.463},
{0.973,0.537,0.384},
{0.478,0.604,0.902},
{0.282,0.765,0.8},
{0.42,0.741,0.431},
{0.949,0.812,0.357},
{0.337,0.667,0.875},
{0.498,0.553,0.882},
{0.902,0.831,0.471},
{0.988,0.725,0.357},
{0.463,0.62,0.851},
{0.204,0.745,0.804},
{0.973,0.694,0.337},
{0.498,0.553,0.882},
{0.843,0.82,0.82},
{0.412,0.608,0.882},
{0.682,0.78,0.439},
{0.396,0.792,0.894},
{0.718,0.506,0.827},
{0.329,0.412,0.553},
{0.718,0.506,0.827},
{0.949,0.812,0.357},
{0.949,0.812,0.357},
{0.533,0.776,0.318},
{0.424,0.631,0.914},
{0.49,0.765,0.49},
{0.349,0.737,0.671},
{0.235,0.592,0.867},
{0.18,0.796,0.745},
{0.914,0.412,0.431},
{0.165,0.451,0.62},
{0.953,0.62,0.345},
{0.541,0.463,0.941},
{0.545,0.604,0.89},
{0.918,0.455,0.635},
{0.561,0.788,0.447},
{0.329,0.412,0.553},
{0.294,0.753,0.463},
{0.294,0.753,0.463},
{0.949,0.812,0.357},
{0.914,0.412,0.431},
{0.722,0.765,0.808},
{0.937,0.494,0.678},
{0.337,0.667,0.875},
{0.384,0.718,0.929},
{0.204,0.745,0.804},
{0.314,0.89,0.761},
{0.2,0.659,0.863}
};

+ (NSString *)sldsIconUniCode:(SLDSIconStandardType)icon{
    return iconUniCode(icon);
}

+ (UIColor *)bgColor:(SLDSIconStandardType)icon{
    if(colors[icon][0]<0 || colors[icon][1]<0 || colors[icon][2]<0){
        return nil;
    }
    return [UIColor colorWithRed:colors[icon][0] green:colors[icon][1] blue:colors[icon][2] alpha:1];
}

@end