//
//  AppTypography.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

public extension View {
    func typography(
        family: AppFontFamily = AppFontFamily.current,
        size: CGFloat = 14,
        weight: Font.Weight = .regular,
        foregroundColor: Color? = nil,
        fixedVertical: Bool = true,
        lineSpacing: CGFloat = 6,
        lineLimit: Int? = nil,
        scaleFactor: CGFloat = 0.0,
        alignment: TextAlignment = .leading
    ) -> some View {
        modifier(
            AppTextModifier(
                family: family,
                size: size,
                weight: weight,
                foregroundColor: foregroundColor,
                fixedVertical: fixedVertical,
                lineLimit: lineLimit,
                lineSpacing: lineSpacing,
                scaleFactor: scaleFactor,
                alignment: alignment
            )
        )
    }
}
