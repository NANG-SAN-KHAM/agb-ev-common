//
//  AppTextModifier.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

struct AppTextModifier: ViewModifier {
    private let font: Font
    private let foregroundColor: Color?
    private let fixedVertical: Bool
    private let lineLimit: Int?
    private let lineSpacing: CGFloat
    private let scaleFactor: CGFloat
    private let alignment: TextAlignment
    
    init(
        family: AppFontFamily = AppFontFamily.current,
        size: CGFloat = 14,
        weight: Font.Weight = .regular,
        foregroundColor: Color? = Color.theme.accent,
        fixedVertical: Bool = true,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat = 6,
        scaleFactor: CGFloat = 0.0,
        alignment: TextAlignment = .leading
    ) {
        switch family {
        case .inter:
            self.font = .inter(size: size, weight: weight)
        case .neotrax:
            self.font = .neotrax(size: size)
        case .adventPro:
            self.font = .adventpro(size: size, weight: weight)
        }
        self.foregroundColor = foregroundColor
        self.fixedVertical = fixedVertical
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing
        self.scaleFactor = scaleFactor
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
            .fixedSize(horizontal: false, vertical: fixedVertical)
            .lineLimit(lineLimit)
            .lineSpacing(lineSpacing)
            .minimumScaleFactor(scaleFactor) // NOTE: 单行 + 缩放生效（字体缩小）
            .multilineTextAlignment(alignment)
    }
}
