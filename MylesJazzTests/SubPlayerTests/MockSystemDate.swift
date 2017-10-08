//
//  MockSystemDate.swift
//  MylesJazz
//
//  Created by Julian Scharf on 3/10/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

class MockSystemDate: IDate {
    
    var mockTimeIntervalSince1970: Double!
    
    func manuallySetSystemTime(time: Double) {
        mockTimeIntervalSince1970 = time
    }
    
    func timeIntervalSince1970() -> Double {
        return mockTimeIntervalSince1970
    }
}
