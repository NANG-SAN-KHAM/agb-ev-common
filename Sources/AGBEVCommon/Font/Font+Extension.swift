//
//  Font+Extension.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

// MARK: - SwiftUI Font Extension

public extension Font {
    // inter
    static func inter(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .custom(InterFont(weight: weight).rawValue, size: size)
    }
    
    // netrox --- netrox only has .regular
    static func neotrax(size: CGFloat) -> Font {
        return .custom(AppFontFamily.neotrax.rawValue, size: size).weight(.regular)
    }
    
    // adventpro
    static func adventpro(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .custom(AdventProFont(weight: weight).rawValue, size: size)
    }
}

// MARK: - UIKit Font Extension

// 字重转换扩展
extension Font.Weight {
    /// 将UIKit的字重转换为SwiftUI的字重
    init(_ uiWeight: UIFont.Weight) {
        switch uiWeight {
        case .ultraLight: self = .ultraLight
        case .thin: self = .thin
        case .light: self = .light
        case .regular: self = .regular
        case .medium: self = .medium
        case .semibold: self = .semibold
        case .bold: self = .bold
        case .heavy: self = .heavy
        case .black: self = .black
        default: self = .regular
        }
    }
}
