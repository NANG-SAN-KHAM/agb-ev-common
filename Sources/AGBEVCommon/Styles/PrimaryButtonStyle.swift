//
//  PrimaryButtonStyle.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let cornerRadius: CGFloat
    let height: CGFloat
    let fixedSize: Bool
    let strokeColor: Color?
    let strokeWidth: CGFloat

    init(
        backgroundColor: Color = Color.theme.accent,
        foregroundColor: Color = .white,
        font: Font = AppFontFamily.current.generateFont(size: 14, weight: .semibold),
        cornerRadius: CGFloat = 4,
        height: CGFloat = 40,
        fixedSize: Bool = false,
        strokeColor: Color? = nil,
        strokeWidth: CGFloat = 1
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.height = height
        self.fixedSize = fixedSize
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }

    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // 背景填充
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)

            // 边框描边（如果有指定）
            if let strokeColor {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(strokeColor, lineWidth: strokeWidth)
            }

            // 按下时暗色覆盖
            if configuration.isPressed {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.black.opacity(0.1))
            }

            // 内容
            configuration.label
                .font(font)
                .foregroundColor(foregroundColor)
                .padding(.horizontal, fixedSize ? 16 : 0)
        }
        .frame(height: height)
        .fixedSize(horizontal: fixedSize, vertical: fixedSize)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .animation(.easeInOut, value: configuration.isPressed)
    }
}


#Preview {
    VStack(spacing: 32) {
        Button("Default Button Style") {}
            .primaryButton()
        
        Button(String("Fiexed Size Button")) {}
            .primaryButton(fixedSize: true)
        
        Button(String("Customize Button Style")) {
            print("Action on loading button")
        }
        .primaryButton(
            backgroundColor: .teal,
            font: .neotrax(size: 16),
            height: 60,
            strokeColor: .red,
            strokeWidth: 5
        )
    }
    .padding(.horizontal, 24)
}
