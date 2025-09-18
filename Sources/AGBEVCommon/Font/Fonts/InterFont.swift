//
//  InterFont.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

enum InterFont: String {
    case thin = "InterVariable-Thin"
    case extralight = "InterVariable-ExtraLight"
    case light = "InterVariable-Light"
    case regular = "InterVariable"
    case medium = "InterVariable-Medium"
    case semibold = "InterVariable-SemiBold"
    case bold = "InterVariable-Bold"
    case extrabold = "InterVariable-ExtraBold"
    case black = "InterVariable-Black"
    
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
