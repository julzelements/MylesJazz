//
//  TimeDatum.swift
//  MylesJazz
//
//  Created by Julian Scharf on 3/10/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

//TimeDatum is initialized when the recording first starts
class TimeDatum {
    
    private var systemTimeWhenRecordingStarted: Double!
    private var movieTimeWhenRecordingStarted: Double!
    private var date: IDate!

    init(date: IDate) {
        self.date = date
       systemTimeWhenRecordingStarted = date.timeIntervalSince1970()
    }
    
    func getSystemTimeWhenRecordingStarted() -> Double {
        return systemTimeWhenRecordingStarted
    }
    
    func setMovieTimeWhenRecordingStarted(time: Double) {
        movieTimeWhenRecordingStarted = time
    }
    
    func getMovieTimeNow() -> Double {
        let systemTimeNow = date.timeIntervalSince1970()
        return systemTimeNow - systemTimeWhenRecordingStarted + movieTimeWhenRecordingStarted
    }
    
    
}
