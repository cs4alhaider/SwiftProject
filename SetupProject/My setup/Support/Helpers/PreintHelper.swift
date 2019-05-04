//
//  PreintHelper.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 04/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import Foundation

/// A logger for my app, identical to the native `print` statement
///
/// This will help me to stop printing any thing to the console
/// if I want at any time to look for something important.
///
/// Also this function should be used for print statements that are always required for
/// debugging and shouldn't be removed as the print statement should not
/// exist in the production environment.
/// Reference for printing the file name and function name and line number from:
/// https://docs.swift.org/swift-book/ReferenceManual/Expressions.html
///
/// - Author: Abdullah Alhaider
func logger<T>(_ items: T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        print("""
            \n==> ✍️ Log called from file: \(file.logFilePath)
            ==> 📝 Function name: \(function)
            ==> 📄 Line number: \(line)
            ===================== 📬 Begin 📬 =========================
            \(items)
            ====================== 📪 End 📪 ==========================
            """)
    #endif
}

/// This function will be used for the network only.
/// - Author: Abdullah Alhaider
func logNetwork<T>(_ items: T, separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        print("""
            \n===================== 📟 ⏳ 📡 =========================
            \(items)
            ======================= 🚀 ⌛️ 📡 =========================
            """, separator: separator, terminator: terminator)
    #endif
}

/// This function will be used for logging the errors to help doing
/// some modifiction like send send all the error to the backend ... etc.
/// - Author: Abdullah Alhaider
func logError<T>(_ items: T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        print("""
            \n==> ‼️ Error log coming from file: \(file.logFilePath)
            ==> ‼️ Function name: \(function)
            ==> ‼️ Line number: \(line)
            ===================== ❌ Begin ❌ =========================
            \(items)
            ====================== ❌ End ❌ ==========================
            """)
    #endif
        // notaTODO: Configure here to send the error with user information
        // and deviceID, app version ... etc details to the backend
}
