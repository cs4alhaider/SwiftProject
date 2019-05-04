//
//  DeviceHelper.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

enum DeviceHelper {
    
    case iPhone5
    case iPhone5c
    case iPhone5s
    
    case iPhone6
    case iPhone6Plus
    
    case iPhone6s
    case iPhone6sPlus
    
    case iPhone7
    case iPhone7Plus
    
    case iPhoneSE
    
    case iPhone8
    case iPhone8Plus
    
    case iPhoneX
    case iPhoneXs
    
    case iPhoneXsMax
    
    case iPhoneXr
    
    case iPad2
    case iPad3
    case iPad4
    
    case iPadAir
    case iPadAir2
    
    case iPad5
    case iPad6
    
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    
    case iPadPro9Inch
    case iPadPro12Inch
    case iPadPro12Inch2
    case iPadPro10Inch
    case iPadPro11Inch
    case iPadPro12Inch3
    
    indirect case simulator(DeviceHelper)
    
    /// Device is not yet known (implemented)
    /// You can still use this enum as before but the description equals the
    /// identifier (you can get multiple identifiers for the same product class
    /// (e.g. "iPhone6,1" or "iPhone 6,2" do both mean "iPhone 5s"))
    case unknown(String)
    
    /// Initializes a `Device` representing the current device this software runs on.
    init() {
        self = DeviceHelper.instance
    }
    
    /// Gets the identifier from the system, such as "iPhone7,1".
    static var identifier: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
    /// Gets the device id from the system
    static var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    private static let instance = DeviceHelper.mapToDevice(identifier: DeviceHelper.identifier)
    
    /// Maps an identifier to a Device. If the identifier can not be mapped
    /// to an existing device, `UnknownDevice(identifier)` is returned.
    ///
    /// - Parameter identifier: The device identifier, e.g. "iPhone7,1". Can be obtained
    ///   from `DeviceHelper.identifier`.
    /// - Returns: An initialized `DeviceHelper`.
    static func mapToDevice(identifier: String) -> DeviceHelper {
        switch identifier {
        case "iPhone5,1", "iPhone5,2": return iPhone5
        case "iPhone5,3", "iPhone5,4": return iPhone5c
        case "iPhone6,1", "iPhone6,2": return iPhone5s
        case "iPhone7,2": return iPhone6
        case "iPhone7,1": return iPhone6Plus
        case "iPhone8,1": return iPhone6s
        case "iPhone8,2": return iPhone6sPlus
        case "iPhone9,1", "iPhone9,3": return iPhone7
        case "iPhone9,2", "iPhone9,4": return iPhone7Plus
        case "iPhone8,4": return iPhoneSE
        case "iPhone10,1", "iPhone10,4": return iPhone8
        case "iPhone10,2", "iPhone10,5": return iPhone8Plus
        case "iPhone10,3", "iPhone10,6": return iPhoneX
        case "iPhone11,2": return iPhoneXs
        case "iPhone11,4", "iPhone11,6": return iPhoneXsMax
        case "iPhone11,8": return iPhoneXr
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3": return iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6": return iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3": return iPadAir
        case "iPad5,3", "iPad5,4": return iPadAir2
        case "iPad6,11", "iPad6,12": return iPad5
        case "iPad7,5", "iPad7,6": return iPad6
        case "iPad2,5", "iPad2,6", "iPad2,7": return iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6": return iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9": return iPadMini3
        case "iPad5,1", "iPad5,2": return iPadMini4
        case "iPad6,3", "iPad6,4": return iPadPro9Inch
        case "iPad6,7", "iPad6,8": return iPadPro12Inch
        case "iPad7,1", "iPad7,2": return iPadPro12Inch2
        case "iPad7,3", "iPad7,4": return iPadPro10Inch
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return iPadPro11Inch
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return iPadPro12Inch3
        case "i386", "x86_64": return simulator(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))
        default: return unknown(identifier)
        }
    }
    
    /// Get the real device from a device.
    /// If the device is a an iPhone8Plus simulator this function returns .iPhone8Plus (the real device).
    /// If the parameter is a real device, this function returns just that passed parameter.
    ///
    /// - Parameter device: A device.
    /// - Returns: the underlying device If the `device` is a `simulator`,
    ///            otherwise return the `device`.
    static func realDevice(from device: DeviceHelper) -> DeviceHelper {
        if case let .simulator(model) = device {
            return model
        }
        return device
    }
    
    /// Returns diagonal screen length in inches
    var diagonal: Double {
        switch self {
        case .iPhone5: return 4
        case .iPhone5c: return 4
        case .iPhone5s: return 4
        case .iPhone6: return 4.7
        case .iPhone6Plus: return 5.5
        case .iPhone6s: return 4.7
        case .iPhone6sPlus: return 5.5
        case .iPhone7: return 4.7
        case .iPhone7Plus: return 5.5
        case .iPhoneSE: return 4
        case .iPhone8: return 4.7
        case .iPhone8Plus: return 5.5
        case .iPhoneX: return 5.8
        case .iPhoneXs: return 5.8
        case .iPhoneXsMax: return 6.5
        case .iPhoneXr: return 6.1
        case .iPad2: return 9.7
        case .iPad3: return 9.7
        case .iPad4: return 9.7
        case .iPadAir: return 9.7
        case .iPadAir2: return 9.7
        case .iPad5: return 9.7
        case .iPad6: return 9.7
        case .iPadMini: return 7.9
        case .iPadMini2: return 7.9
        case .iPadMini3: return 7.9
        case .iPadMini4: return 7.9
        case .iPadPro9Inch: return 9.7
        case .iPadPro12Inch: return 12.9
        case .iPadPro12Inch2: return 12.9
        case .iPadPro10Inch: return 10.5
        case .iPadPro11Inch: return 11.0
        case .iPadPro12Inch3: return 12.9
        case .simulator(let model): return model.diagonal
        case .unknown: return -1
        }
    }
    
    /// Returns screen ratio as a tuple
    var screenRatio: (width: Double, height: Double) {
        switch self {
        case .iPhone5: return (width: 9, height: 16)
        case .iPhone5c: return (width: 9, height: 16)
        case .iPhone5s: return (width: 9, height: 16)
        case .iPhone6: return (width: 9, height: 16)
        case .iPhone6Plus: return (width: 9, height: 16)
        case .iPhone6s: return (width: 9, height: 16)
        case .iPhone6sPlus: return (width: 9, height: 16)
        case .iPhone7: return (width: 9, height: 16)
        case .iPhone7Plus: return (width: 9, height: 16)
        case .iPhoneSE: return (width: 9, height: 16)
        case .iPhone8: return (width: 9, height: 16)
        case .iPhone8Plus: return (width: 9, height: 16)
        case .iPhoneX: return (width: 9, height: 19.5)
        case .iPhoneXs: return (width: 9, height: 19.5)
        case .iPhoneXsMax: return (width: 9, height: 19.5)
        case .iPhoneXr: return (width: 9, height: 19.5)
        case .iPad2: return (width: 3, height: 4)
        case .iPad3: return (width: 3, height: 4)
        case .iPad4: return (width: 3, height: 4)
        case .iPadAir: return (width: 3, height: 4)
        case .iPadAir2: return (width: 3, height: 4)
        case .iPad5: return (width: 3, height: 4)
        case .iPad6: return (width: 3, height: 4)
        case .iPadMini: return (width: 3, height: 4)
        case .iPadMini2: return (width: 3, height: 4)
        case .iPadMini3: return (width: 3, height: 4)
        case .iPadMini4: return (width: 3, height: 4)
        case .iPadPro9Inch: return (width: 3, height: 4)
        case .iPadPro12Inch: return (width: 3, height: 4)
        case .iPadPro12Inch2: return (width: 3, height: 4)
        case .iPadPro10Inch: return (width: 3, height: 4)
        case .iPadPro11Inch: return (width: 139, height: 199)
        case .iPadPro12Inch3: return (width: 512, height: 683)
        case .simulator(let model): return model.screenRatio
        case .unknown: return (width: -1, height: -1)
        }
    }
    
    /// All iPhones
    static var allPhones: [DeviceHelper] {
        return [.iPhone5, .iPhone5c, .iPhone5s,
                .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,
                .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus,
                .iPhoneX, .iPhoneXs, .iPhoneXsMax, .iPhoneXr]
    }
    
    /// All iPads
    static var allPads: [DeviceHelper] {
        return [.iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2,
                .iPad5, .iPad6, .iPadMini, .iPadMini2, .iPadMini3,
                .iPadMini4, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2,
                .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// All X-Series Devices
    static var allXSeriesDevices: [DeviceHelper] {
        return [.iPhoneX, .iPhoneXs, .iPhoneXsMax, .iPhoneXr]
    }
    
    /// All Plus-Sized Devices
    static var allPlusSizedDevices: [DeviceHelper] {
        return [.iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus]
    }
    
    /// All Pro Devices
    static var allProDevices: [DeviceHelper] {
        return [.iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2,
                .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// All mini Devices
    static var allMiniDevices: [DeviceHelper] {
        return [.iPadMini, .iPadMini2, .iPadMini3, .iPadMini4]
    }
    
    /// All simulator iPhones
    static var allSimulatorPhones: [DeviceHelper] {
        return allPhones.map(DeviceHelper.simulator)
    }
    
    /// All simulator iPads
    static var allSimulatorPads: [DeviceHelper] {
        return allPads.map(DeviceHelper.simulator)
    }
    
    /// All simulator iPad mini
    static var allSimulatorMiniDevices: [DeviceHelper] {
        return allMiniDevices.map(DeviceHelper.simulator)
    }
    
    /// All simulator Plus-Sized Devices
    static var allSimulatorXSeriesDevices: [DeviceHelper] {
        return allXSeriesDevices.map(DeviceHelper.simulator)
    }
    
    /// All simulator Plus-Sized Devices
    static var allSimulatorPlusSizedDevices: [DeviceHelper] {
        return allPlusSizedDevices.map(DeviceHelper.simulator)
    }
    
    /// All simulator Pro Devices
    static var allSimulatorProDevices: [DeviceHelper] {
        return allProDevices.map(DeviceHelper.simulator)
    }
    
    /// Returns whether the device is an iPhone (real or simulator)
    var isPhone: Bool {
        return (isOneOf(DeviceHelper.allPhones)
            || isOneOf(DeviceHelper.allSimulatorPhones)
            || UIDevice.current.userInterfaceIdiom == .phone)
    }
    
    /// Returns whether the device is an iPad (real or simulator)
    var isPad: Bool {
        return isOneOf(DeviceHelper.allPads)
            || isOneOf(DeviceHelper.allSimulatorPads)
            || UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /// Returns whether the device is any of the simulator
    /// Useful when there is a need to check and skip running a portion of code (location request or others)
    var isSimulator: Bool {
        return isOneOf(DeviceHelper.allSimulators)
    }
    
    /// If this device is a simulator return the underlying device,
    /// otherwise return `self`.
    var realDevice: DeviceHelper {
        return DeviceHelper.realDevice(from: self)
    }
    
    /// All Touch ID Capable Devices
    static var allTouchIDCapableDevices: [DeviceHelper] {
        return [.iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,
                .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus,
                .iPadAir2, .iPad5, .iPad6, .iPadMini3, .iPadMini4, .iPadPro9Inch,
                .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch]
    }
    
    /// All Face ID Capable Devices
    static var allFaceIDCapableDevices: [DeviceHelper] {
        return [.iPhoneX, .iPhoneXs, .iPhoneXsMax, .iPhoneXr, .iPadPro11Inch, .iPadPro12Inch3]
    }
    
    /// Returns whether or not the device has Touch ID
    var isTouchIDCapable: Bool {
        return isOneOf(DeviceHelper.allTouchIDCapableDevices)
    }
    
    /// Returns whether or not the device has Face ID
    var isFaceIDCapable: Bool {
        return isOneOf(DeviceHelper.allFaceIDCapableDevices)
    }
    
    /// Returns whether or not the device has any biometric sensor (i.e. Touch ID or Face ID)
    var hasBiometricSensor: Bool {
        return isTouchIDCapable || isFaceIDCapable
    }
    
    /// All real devices (i.e. all devices except for all simulators)
    static var allRealDevices: [DeviceHelper] {
        return allPhones + allPads
    }
    
    /// All simulators
    static var allSimulators: [DeviceHelper] {
        return allRealDevices.map(DeviceHelper.simulator)
    }
    
    /// This method saves us in many cases from the need of updating your code with every new device.
    /// Most uses for an enum like this are the following:
    ///
    /// ```
    /// switch DeviceHelper() {
    /// case .iPhone5, .iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,
    /// .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX: callMethodOnIPhones()
    /// case .iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPadMini, .
    /// iPadMini2, .iPadMini3, .iPadMini4, .iPadPro: callMethodOnIPads()
    /// default: break
    /// }
    /// ```
    /// This code can now be replaced with
    ///
    /// ```
    /// let device = DeviceHelper()
    /// if device.isOneOf(DeviceHelper.allPhones) {
    /// callMethodOnIPhones()
    /// } else if device.isOneOf(DeviceHelper.allPads) {
    /// callMethodOnIPads()
    /// }
    /// ```
    /// - Parameter devices: An array of devices.
    /// - Returns: Returns whether the current device is one of the passed in ones.
    func isOneOf(_ devices: [DeviceHelper]) -> Bool {
        return devices.contains(self)
    }
    
    /// The name identifying the device (e.g. "Dennis' iPhone").
    var name: String {
        return UIDevice.current.name
    }
    
    /// The name of the operating system running on the device represented by the receiver (e.g. "iOS" or "tvOS").
    var systemName: String {
        return UIDevice.current.systemName
    }
    
    /// The current version of the operating system (e.g. 8.4 or 9.2).
    var systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    /// The model of the device (e.g. "iPhone" or "iPad").
    var model: String {
        return UIDevice.current.model
    }
    
    /// The model of the device as a localized string.
    var localizedModel: String {
        return UIDevice.current.localizedModel
    }
    
    /// PPI (Pixels per Inch) on the current device's screen (if applicable). When the device is not applicable this property returns nil.
    var ppi: Int? {
        switch self {
        case .iPhone5: return 326
        case .iPhone5c: return 326
        case .iPhone5s: return 326
        case .iPhone6: return 326
        case .iPhone6Plus: return 401
        case .iPhone6s: return 326
        case .iPhone6sPlus: return 401
        case .iPhone7: return 326
        case .iPhone7Plus: return 401
        case .iPhoneSE: return 326
        case .iPhone8: return 326
        case .iPhone8Plus: return 401
        case .iPhoneX: return 458
        case .iPhoneXs: return 458
        case .iPhoneXsMax: return 458
        case .iPhoneXr: return 326
        case .iPad2: return 132
        case .iPad3: return 264
        case .iPad4: return 264
        case .iPadAir: return 264
        case .iPadAir2: return 264
        case .iPad5: return 264
        case .iPad6: return 264
        case .iPadMini: return 163
        case .iPadMini2: return 326
        case .iPadMini3: return 326
        case .iPadMini4: return 326
        case .iPadPro9Inch: return 264
        case .iPadPro12Inch: return 264
        case .iPadPro12Inch2: return 264
        case .iPadPro10Inch: return 264
        case .iPadPro11Inch: return 264
        case .iPadPro12Inch3: return 264
        case .simulator(let model): return model.ppi
        case .unknown: return nil
        }
    }
    
}

extension DeviceHelper: CustomStringConvertible {
    /// A textual representation of the device.
    var description: String {
        switch self {
        case .iPhone5: return "iPhone 5"
        case .iPhone5c: return "iPhone 5c"
        case .iPhone5s: return "iPhone 5s"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6s: return "iPhone 6s"
        case .iPhone6sPlus: return "iPhone 6s Plus"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXs: return "iPhone Xs"
        case .iPhoneXsMax: return "iPhone Xs Max"
        case .iPhoneXr: return "iPhone Xr"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad 3"
        case .iPad4: return "iPad 4"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPad5: return "iPad 5"
        case .iPad6: return "iPad 6"
        case .iPadMini: return "iPad Mini"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadPro9Inch: return "iPad Pro (9.7-inch)"
        case .iPadPro12Inch: return "iPad Pro (12.9-inch)"
        case .iPadPro12Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro10Inch: return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch: return "iPad Pro (11-inch)"
        case .iPadPro12Inch3: return "iPad Pro (12.9-inch) (3rd generation)"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown(let identifier): return identifier
        }
    }
}

// MARK: - Equatable
extension DeviceHelper: Equatable {
    
    /// Compares two devices
    ///
    /// - Parameter lhs: A device.
    /// - Parameter rhs: Another device.
    /// - Returns: `true` if the underlying identifier is the same.
    static func == (lhs: DeviceHelper, rhs: DeviceHelper) -> Bool {
        return lhs.description == rhs.description
    }
    
}

// MARK: - Orientation
extension DeviceHelper {
    
    /// This enum describes the state of the orientation.
    /// - Landscape: The device is in Landscape Orientation
    /// - Portrait:  The device is in Portrait Orientation
    enum Orientation {
        case landscape
        case portrait
    }
    
    var orientation: Orientation {
        if UIDevice.current.orientation.isLandscape {
            return .landscape
        } else {
            return .portrait
        }
    }
}
