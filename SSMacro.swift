//
//  SSMacro.swift
//  eye
//
//  Created by aosue on 2019/1/2.
//  Copyright © 2019 aosue. All rights reserved.
//

import Foundation
import Cocoa


public let kWidth  : CGFloat = (NSScreen.main?.frame.width)!
public let kHeight : CGFloat = (NSScreen.main?.frame.height)!

// 沙盒路径 Document Cache temp
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
let kCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
let kTempPath = NSTemporaryDirectory()

// APP版本号
let kAppVersion : String = Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String

let OSInfoFile : String   =    "/System/Library/CoreServices/SystemVersion.plist"
let OSInfoFile_server:String = "/System/Library/CoreServices/ServerVersion.plist"

let isOSServer = !NSURL(fileURLWithPath: OSInfoFile_server).checkResourceIsReachableAndReturnError(nil)

// 颜色
public func randColor() -> NSColor {
    return NSColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 0.5)
}

// 注册通知
func kNOTIFY_ADD(observer: Any, selector: Selector, name: String) {
    return NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
}
// 发送通知
func kNOTIFY_POST(name: String, object: Any) {
    return NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
}
// 移除通知
func kNOTIFY_REMOVE(observer: Any, name: String) {
    return NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: name), object: nil)
}

// 开发Log
func DLog<T>(_ msg: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let lastName = ((fileName as NSString).pathComponents.last!)
    print("\n\(dformatter.string(from: Date())) [\(lastName)][第\(lineNumber)行] \n\t\t \(msg)")
    #endif
}
