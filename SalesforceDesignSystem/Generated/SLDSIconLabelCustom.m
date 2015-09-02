/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSIconLabelCustom.h"

#define iconName(enum) [@[\
@"SLDSIconCustom1",\
@"SLDSIconCustom10",\
@"SLDSIconCustom100",\
@"SLDSIconCustom11",\
@"SLDSIconCustom12",\
@"SLDSIconCustom13",\
@"SLDSIconCustom14",\
@"SLDSIconCustom15",\
@"SLDSIconCustom16",\
@"SLDSIconCustom17",\
@"SLDSIconCustom18",\
@"SLDSIconCustom19",\
@"SLDSIconCustom2",\
@"SLDSIconCustom20",\
@"SLDSIconCustom21",\
@"SLDSIconCustom22",\
@"SLDSIconCustom23",\
@"SLDSIconCustom24",\
@"SLDSIconCustom25",\
@"SLDSIconCustom26",\
@"SLDSIconCustom27",\
@"SLDSIconCustom28",\
@"SLDSIconCustom29",\
@"SLDSIconCustom3",\
@"SLDSIconCustom30",\
@"SLDSIconCustom31",\
@"SLDSIconCustom32",\
@"SLDSIconCustom33",\
@"SLDSIconCustom34",\
@"SLDSIconCustom35",\
@"SLDSIconCustom36",\
@"SLDSIconCustom37",\
@"SLDSIconCustom38",\
@"SLDSIconCustom39",\
@"SLDSIconCustom4",\
@"SLDSIconCustom40",\
@"SLDSIconCustom41",\
@"SLDSIconCustom42",\
@"SLDSIconCustom43",\
@"SLDSIconCustom44",\
@"SLDSIconCustom45",\
@"SLDSIconCustom46",\
@"SLDSIconCustom47",\
@"SLDSIconCustom48",\
@"SLDSIconCustom49",\
@"SLDSIconCustom5",\
@"SLDSIconCustom50",\
@"SLDSIconCustom51",\
@"SLDSIconCustom52",\
@"SLDSIconCustom53",\
@"SLDSIconCustom54",\
@"SLDSIconCustom55",\
@"SLDSIconCustom56",\
@"SLDSIconCustom57",\
@"SLDSIconCustom58",\
@"SLDSIconCustom59",\
@"SLDSIconCustom6",\
@"SLDSIconCustom60",\
@"SLDSIconCustom61",\
@"SLDSIconCustom62",\
@"SLDSIconCustom63",\
@"SLDSIconCustom64",\
@"SLDSIconCustom65",\
@"SLDSIconCustom66",\
@"SLDSIconCustom67",\
@"SLDSIconCustom68",\
@"SLDSIconCustom69",\
@"SLDSIconCustom7",\
@"SLDSIconCustom70",\
@"SLDSIconCustom71",\
@"SLDSIconCustom72",\
@"SLDSIconCustom73",\
@"SLDSIconCustom74",\
@"SLDSIconCustom75",\
@"SLDSIconCustom76",\
@"SLDSIconCustom77",\
@"SLDSIconCustom78",\
@"SLDSIconCustom79",\
@"SLDSIconCustom8",\
@"SLDSIconCustom80",\
@"SLDSIconCustom81",\
@"SLDSIconCustom82",\
@"SLDSIconCustom83",\
@"SLDSIconCustom84",\
@"SLDSIconCustom85",\
@"SLDSIconCustom86",\
@"SLDSIconCustom87",\
@"SLDSIconCustom88",\
@"SLDSIconCustom89",\
@"SLDSIconCustom9",\
@"SLDSIconCustom90",\
@"SLDSIconCustom91",\
@"SLDSIconCustom92",\
@"SLDSIconCustom93",\
@"SLDSIconCustom94",\
@"SLDSIconCustom95",\
@"SLDSIconCustom96",\
@"SLDSIconCustom97",\
@"SLDSIconCustom98",\
@"SLDSIconCustom99" \
] objectAtIndex:enum]


@implementation SLDSIconLabelCustom

+ (NSString *)sldsIconName:(SLDSIconCustomType)icon{
    return iconName(icon);
}

@end
