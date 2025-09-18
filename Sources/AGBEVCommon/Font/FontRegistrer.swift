//
//  FontRegistrer.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public actor FontRegistrar {
    private var isRegistered = false
    
    public static let shared = FontRegistrar()
    
    /// 支持懒加载注册字体
    /// 第一次调用或第一次使用字体时自动注册
    public  func registerIfNeeded() {
        guard !isRegistered else { return }
        isRegistered = true
        
        registerFonts()
    }
    
    /// 注册所有字体
    private  func registerFonts() {
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
    private  func register(_ name: String, type: String) {
        guard let url = frameworkBundle.url(forResource: name, withExtension: type, subdirectory: nil) else {
            print("[AGBEVCommon][FontRegistrer] Missing font: \(name).\(type)")
            print("[AGBEVCommon][FontRegistrer] bundlePath: \(frameworkBundle.bundlePath)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) {
            let err = error?.takeUnretainedValue()
            print("[AGBEVCommon][FontRegistrer] Failed to register \(name): \(String(describing: err))")
        }
    }
    
    /// 获取 Framework 对应的 Bundle
    /// 使用 BundleToken.self 确保获取到的是本 Framework 的 bundle
    private  var frameworkBundle: Bundle {
        Bundle(for: BundleToken.self)
    }
    
    /// 占位类，仅用于 Bundle 定位
    private final class BundleToken {}
    
    /// 打印系统中可用字体列表（调试用）
    private  func printAllAvailableFonts() {
#if DEBUG
        print("=== Available Font List ===")
        for family in UIFont.familyNames.sorted() {
            print("Font Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family).sorted() {
                print("  - \(name)")
            }
        }
        print("===================")
#endif
    }
}
