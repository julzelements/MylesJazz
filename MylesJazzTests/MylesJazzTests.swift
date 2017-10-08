//
//  MylesJazzTests.swift
//  MylesJazzTests
//
//  Created by Julian Scharf on 3/9/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest
@testable import MylesJazz

class MylesJazzTests: XCTestCase {
    var ironMan: URL!
    var recognizer: Recognize!
    
    override func setUp() {
        super.setUp()
        self.ironMan = Bundle.main.url(forResource: "ironMan", withExtension: "wav")
        self.recognizer = Recognize(audioFilePath: ironMan)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertNotNil(ironMan)
    }
    
    func test_recognizerReturn400Seconds() {
        recognizer.recognize()
    }
    
}
