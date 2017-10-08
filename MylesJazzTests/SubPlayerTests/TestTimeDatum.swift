//
//  TestTimeDatum.swift
//  MylesJazzTests
//
//  Created by Julian Scharf on 3/10/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest

class TestTimeDatum: XCTestCase {
    
    
    //Scenario:
    //TimeDatum is initialised when the system time is 1500.05 seconds
    //A few moments later the API returns with a movieTime Value of 36.09 seconds
    //The movie time can be recalculated at system time of 1506.58 seconds
    //This should return movie time now of 1506.58 - 1500.05 + 36.09 seconds
    
    
    
    func testTimeDatumShouldReturnInjectedTime() {
        let mockDate = MockSystemDate()
        mockDate.manuallySetSystemTime(time: 1500.05)
        
        let timeDatum = TimeDatum(date: mockDate)
        
        XCTAssertEqual(1500.05,  timeDatum.getSystemTimeWhenRecordingStarted())
    }
    
    func testTimeDatumShouldCalculateMovieTimeNow() {
        let mockDate = MockSystemDate()
        mockDate.manuallySetSystemTime(time: 1500.05)
        
        let timeDatum = TimeDatum(date: mockDate)
        
        //Api return movie time of 36.09
        timeDatum.setMovieTimeWhenRecordingStarted(time: 36.09)
        
        //re-inject system time of 1506.58
        mockDate.manuallySetSystemTime(time: 1506.58)
        
        let movieTimeNow = timeDatum.getMovieTimeNow()
        print(movieTimeNow)
        let expected = 1506.58 - 1500.05 + 36.09
        
        XCTAssertEqual(expected , movieTimeNow)
        
        
    }
    

    

    
}
