//
//  TestAudioRecorder.swift
//  MylesJazzTests
//
//  Created by Julian Scharf on 8/10/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest

class TestAudioRecorder: XCTestCase {
    
    func testMakeAudioRecorder() {
        _ = AudioRecorder()
    }
    
    func testAudioRecorderShouldCreateRecordedAudioObject() {
        let recorder = AudioRecorder()
        recorder.record()
        sleep(2)
        recorder.stop()
        XCTAssertTrue(recorder.recordedAudio != nil)
    }

    
}
