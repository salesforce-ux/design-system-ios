#import "SalesforceDesignSystem.h"
#import <XCTest/XCTest.h>

#define roundFloat(input) round(input*100)/100

@interface SLDSTests : XCTestCase
@end

@implementation SLDSTests

// COLORS
//-------------------------------------------------------------------

- (void)testFillAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsFill:SLDSFillBrand] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.44, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.82, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

//-------------------------------------------------------------------

- (void)testBackgroundColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsBackgroundColor:SLDSColorBackgroundInverse] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0.02, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.11, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.25, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

//-------------------------------------------------------------------

- (void)testBorderColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsBorderColor:SLDSColorBorderButtonInverseDisabled] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 1, @"Red equal");
    XCTAssertEqual(roundFloat(green), 1, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 1, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 0.15, @"Alpha equal");
}

//-------------------------------------------------------------------

- (void)testTextColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsTextColor:SLDSColorTextError] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0.76, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.22, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.2, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

//-------------------------------------------------------------------

- (void)testFillRange {
    UIColor *color = [UIColor sldsFill:SLDSFillTypeLast+1];
    XCTAssertEqual(color, nil, @"Fill range max + 1");
    
    color = [UIColor sldsFill:SLDSFillTypeLast+1];
    XCTAssertEqual(color, nil, @"Fill range min - 1");
}

//-------------------------------------------------------------------

- (void)testBackgroundColorRange {
    UIColor *color = [UIColor sldsBackgroundColor:SLDSBackgroundColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Background color range max + 1");
    
    color = [UIColor sldsBackgroundColor:SLDSBackgroundColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Background color range min - 1");
}

//-------------------------------------------------------------------

- (void)testBorderColorRange {
    UIColor *color = [UIColor sldsBorderColor:SLDSBorderColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Border color range max + 1");
    
    color = [UIColor sldsBorderColor:SLDSBorderColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Border color range min - 1");
}

//-------------------------------------------------------------------

- (void)testTextColorRange {
    UIColor *color = [UIColor sldsTextColor:SLDSTextColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Text color range max + 1");
    
    color = [UIColor sldsTextColor:SLDSTextColorTypeLast+1];
    XCTAssertEqual(color, nil, @"Text color range min - 1");
}

// ICONS
//-------------------------------------------------------------------

- (void)testActionIconRange {
    UIImage *icon = [UIImage sldsActionIcon:SLDSActionIconTypeLast+1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range max + 1");
    
    icon = [UIImage sldsActionIcon:SLDSActionIconTypeFirst-1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range min - 1");
}

//-------------------------------------------------------------------

- (void)testCustomIconRange {
    UIImage *icon = [UIImage sldsCustomIcon:SLDSCustomIconTypeLast+1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range max + 1");
    
    icon = [UIImage sldsCustomIcon:SLDSCustomIconTypeFirst-1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range min - 1");
}

//-------------------------------------------------------------------

- (void)testStandardIconRange {
    UIImage *icon = [UIImage sldsStandardIcon:SLDSStandardIconTypeLast+1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range max + 1");
    
    icon = [UIImage sldsStandardIcon:SLDSStandardIconTypeFirst-1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range min - 1");
}

//-------------------------------------------------------------------

- (void)testUtilityIconRange {
    UIImage *icon = [UIImage sldsUtilityIcon:SLDSUtilityIconTypeLast+1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range max + 1");
    
    icon = [UIImage sldsUtilityIcon:SLDSUtilityIconTypeFirst-1 withSize:SLDSSizeLarge];
    XCTAssertEqual(icon, nil, @"Fill range min - 1");
}

@end
