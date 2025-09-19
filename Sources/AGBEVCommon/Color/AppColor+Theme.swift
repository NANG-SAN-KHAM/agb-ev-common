//
//  AppColor+Theme.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public struct ColorTheme: Sendable {
    public let accent: Color
    public let primaryColor: Color
    public let secondaryColor: Color
    public let tertiaryColor: Color
    public let labelColor: Color
    public let backgroundColor: Color
    public let hintTextColor: Color
    public let buttonColor: Color
    public let buttonDisableColor: Color
    public let borderColor: Color
    public let cardColor: Color
    public let warningColor: Color
    
    public init() {
        // 使用 bundle: .module 指定 Swift Package 内资源
        self.accent = Color("AccentColor", bundle: .module)
        self.primaryColor = Color("AppPrimaryColor", bundle: .module)
        self.secondaryColor = Color("AppSecondaryColor", bundle: .module)
        self.tertiaryColor = Color("AppTertiaryColor", bundle: .module)
        self.labelColor = Color("AppLabelColor", bundle: .module)
        self.backgroundColor = Color("AppBackgroundColor", bundle: .module)
        self.hintTextColor = Color("AppHintTextColor", bundle: .module)
        self.buttonColor = Color("AppButtonColor", bundle: .module)
        self.buttonDisableColor = Color("AppButtonDisableColor", bundle: .module)
        self.borderColor = Color("AppBorderColor", bundle: .module)
        self.cardColor = Color("AppCardColor", bundle: .module)
        self.warningColor = Color("AppWarningColor", bundle: .module)
    }
}
