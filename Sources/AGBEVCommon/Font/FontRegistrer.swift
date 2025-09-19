//
//  FontRegistrer.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public enum FontRegistrer {
    
    public static func registerIfNeeded() {
        _ = once
    }
    
    private static let once: Void = {
        registerFonts()
    }()
    
    /// 注册所有字体
    private static func registerFonts() {
        let fonts = [
            "Inter-Variable",
            "AdventPro-Variable",
            "Neotrax-Regular"
        ]
        
        for font in fonts {
            register(font, type: "ttf")
        }
        
        printAllAvailableFonts()
    }
    
    /// 私有注册方法
    /// - Parameters:
    ///   - name: 字体文件名称（不包含扩展名）
    ///   - type: 字体文件类型，如 "ttf"
    private static func register(_ name: String, type: String) {
        guard let url = Bundle.module.url(forResource: name, withExtension: type, subdirectory: nil) else {
            print("[AGBEVCommon][FontRegistrer] Missing font: \(name).\(type)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) {
            let err = error?.takeUnretainedValue()
            print("[AGBEVCommon][FontRegistrer] Failed to register \(name): \(String(describing: err))")
        }
    }
    
    /// 打印系统中可用字体列表（调试用）
    private static func printAllAvailableFonts() {
#if DEBUG
        print("=== Available Font List ===")
        for family in UIFont.familyNames.sorted() {
            print("Font Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family).sorted() {
                print("  - \(name)")
            }
        }
        print("===================")
#endif // DEBUG
    }
}
