//
//  AppFontFamily.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

// MARK: - App Font Family

public enum AppFontFamily: String, Sendable {
    case inter = "Inter"
    case neotrax = "Neotrax" // NOTE: Neotrax only has `regular` font weight
    case adventPro = "AdventPro"
    
    // 字体优先级静态配置（按设计需求排序）
    public static let primary = AppFontFamily.inter
    public static let secondary = AppFontFamily.adventPro
    public static let tertiary = AppFontFamily.neotrax
    
    // 当前使用的字体配置
    public static let current: AppFontFamily = primary
    
    // 获取CSS使用的字体家族名称
    public var cssName: String {
        switch self {
        case .inter:       return "Inter Variable"
        case .neotrax:     return "Neotrax"
        case .adventPro:   return "Advent Pro"
        }
    }
    
    // 获取字体文件名称（对应资源文件）
    public var fileName: String {
        switch self {
        case .inter:       return "Inter-Variable.ttf"
        case .neotrax:     return "Neotrax-Regular.ttf"
        case .adventPro:   return "AdventPro-Variable.ttf"
        }
    }
}


// MARK: - App Font Family Extension

public extension AppFontFamily {
    /// 生成SwiftUI字体对象
    /// - Parameters:
    ///   - size: 字号，默认14
    ///   - weight: 字重，默认常规
    /// - Returns: 配置好的Font对象
    func generateFont(size: CGFloat = 14, weight: Font.Weight = .regular) -> Font {
        switch self {
        case .inter:
            return .inter(size: size, weight: weight)       // Inter可变字体
        case .neotrax:
            return .neotrax(size: size)                    // Neotrax固定字重字体
        case .adventPro:
            return .adventpro(size: size, weight: weight)   // Advent Pro可变字体
        }
    }
    
    /// 生成UIKit字体对象
    /// - Parameters:
    ///   - size: 字号，默认14
    ///   - weight: 字重，默认常规
    /// - Returns: 配置好的UIFont对象（如果找不到字体则返回系统字体）
    func generateUIFont(size: CGFloat = 14, weight: UIFont.Weight = .regular) -> UIFont {
        let fontName: String
        
        switch self {
        case .inter:
            // 通过InterFont类型获取对应字重名称
            fontName = InterFont(weight: Font.Weight(weight)).rawValue
        case .neotrax:
            // Neotrax是单字重字体，直接使用固定名称
            fontName = "Neotrax"
        case .adventPro:
            // 通过AdventProFont类型获取对应字重名称
            fontName = AdventProFont(weight: Font.Weight(weight)).rawValue
        }
        
        // 尝试创建字体，失败时返回系统字体
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}
