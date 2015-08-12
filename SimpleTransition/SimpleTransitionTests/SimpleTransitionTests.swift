//
//  SimpleTransitionTests.swift
//  SimpleTransitionTests
//
//  Created by machida hideyuki on 2015/08/11.
//  Copyright © 2015年 machida hideyuki. All rights reserved.
//

import XCTest
@testable import SimpleTransition

class SimpleTransitionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEaseLinear() {
		XCTAssertEqual(10, SimpleTransition.easeLinear(10, b: 0, c: 100, d: 100))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
