//
//  AppButtons.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public extension View {
    func primaryButton(
        backgroundColor: Color = Color.theme.accent,
        foregroundColor: Color = .white,
        font: Font = AppFontFamily.current.generateFont(size: 14, weight: .semibold),
        cornerRadius: CGFloat = 4,
        height: CGFloat = 40,
        fixedSize: Bool = false,
        strokeColor: Color? = nil,
        strokeWidth: CGFloat = 1
    ) -> some View {
        modifier(
            PrimaryButtonModifier(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                font: font,
                cornerRadius: cornerRadius,
                height: height,
                fixedSize: fixedSize,
                strokeColor: strokeColor,
                strokeWidth: strokeWidth
            )
        )
    }
}
