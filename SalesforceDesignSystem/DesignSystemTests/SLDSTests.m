#import "SalesforceDesignSystem.h"
#import <XCTest/XCTest.h>

#define roundFloat(input) round(input*100)/100

@interface SLDSTests : XCTestCase
@end

@implementation SLDSTests

- (void)testFillColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsFill:SLDSFillBrand] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.44, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.82, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

- (void)testBackgroundColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsBackgroundColor:SLDSColorBackgroundInverse] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0.02, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.11, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.25, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

- (void)testBorderColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsBorderColor:SLDSColorBorderButtonInverseDisabled] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 1, @"Red equal");
    XCTAssertEqual(roundFloat(green), 1, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 1, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 0.15, @"Alpha equal");
}

- (void)testTextColorAccuracy {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsTextColor:SLDSColorTextError] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0.76, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0.22, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0.2, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 1, @"Alpha equal");
}

- (void)testColorRange {
    CGFloat red, green, blue, alpha;
    [[UIColor sldsTextColor:SLDSTextColorTypeLast+1] getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(roundFloat(red), 0, @"Red equal");
    XCTAssertEqual(roundFloat(green), 0, @"Green equal");
    XCTAssertEqual(roundFloat(blue), 0, @"Blue equal");
    XCTAssertEqual(roundFloat(alpha), 0, @"Alpha equal");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
