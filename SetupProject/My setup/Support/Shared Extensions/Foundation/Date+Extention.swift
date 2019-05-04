//
//  Date+Extention.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

extension Date {
    
    /// Calculating the time from a given date
    ///
    /// - Parameter date: date
    /// - Returns: time diff
    ///
    /// - Author: Abdullah Alhaider
    func timeSince(_ date: Date) -> TimeInterval {
        let time = Date()
        return time.timeIntervalSince(date)
    }
}
