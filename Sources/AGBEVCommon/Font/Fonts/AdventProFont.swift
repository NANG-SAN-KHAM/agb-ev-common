//
//  AdventProFont.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

enum AdventProFont: String {
    case thin = "AdventPro-Regular_Thin"
    case extralight = "AdventPro-Regular_ExtraLight"
    case light = "AdventPro-Regular_Light"
    case regular = "AdventPro-Regular"
    case medium = "AdventPro-Regular_Medium"
    case semibold = "AdventPro-Regular_SemiBold"
    case bold = "AdventPro-Regular_Bold"
    case extrabold = "AdventPro-Regular_ExtraBold"
    case black = "AdventPro-Regular_Black"
    
    init(weight: Font.Weight) {
        switch weight {
        case .ultraLight:
            self = .thin
        case .thin:
            self = .extralight
        case .light:
            self = .light
        case .regular:
            self = .regular
        case .medium:
            self = .medium
        case .semibold:
            self = .semibold
        case .bold:
            self = .bold
        case .heavy:
            self = .extrabold
        case .black:
            self = .black
        default:
            self = .regular
        }
    }
}
