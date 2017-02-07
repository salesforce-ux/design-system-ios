//
//  DesignSystemTests.m
//  DesignSystemTests
//
//  Created by John Earle on 2/7/17.
//  Copyright © 2017 Salesforce UX. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DesignSystemTests : XCTestCase

@end

@implementation DesignSystemTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCTAssertEqual(5, 5, @"This tests if 5 = 5.");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
