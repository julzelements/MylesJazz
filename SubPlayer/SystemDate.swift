//
//  SystemDate.swift
//  MylesJazz
//
//  Created by Julian Scharf on 3/10/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

class SystemNow: IDate {
    func timeIntervalSince1970() -> Double {
        return Date().timeIntervalSince1970
    }
}
