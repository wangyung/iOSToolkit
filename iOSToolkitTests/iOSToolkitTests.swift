//
//  iOSToolkitTests.swift
//  iOSToolkitTests
//
//  Created by Freddie Wang on 2015/6/7.
//  Copyright (c) 2015年 freddie. All rights reserved.
//

import UIKit
import XCTest

class iOSToolkitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUrlEncodedString() {
        let str1 = "MTIzNA==".urlEncodedString
        XCTAssertTrue("MTIzNA%3D%3D" == str1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
