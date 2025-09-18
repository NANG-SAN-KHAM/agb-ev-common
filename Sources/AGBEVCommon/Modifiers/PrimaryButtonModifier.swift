//
//  PrimaryButtonModifier.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let cornerRadius: CGFloat
    let height: CGFloat
    let fixedSize: Bool
    let strokeColor: Color?
    let strokeWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(
                PrimaryButtonStyle(
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
