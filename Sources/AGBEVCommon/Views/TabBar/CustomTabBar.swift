//
//  CustomTabBar.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/19/25.
//

import SwiftUI
import AGBCommon

public struct CustomTabBar: View {
    
    @State private var textWidths: [Int: CGFloat] = [:]
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [TabBarItem]
    
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 16) {
                    ForEach(Array(tabBarItems.enumerated()), id: \.element.id) { index, item in
                        Text(item.title)
                            .typography(size: 14)
                            .fontWeight(tabSelection == index + 1 ? .bold : .regular)
                            .foregroundColor(tabSelection == index + 1 ? Color.theme.primaryColor : .gray)
                            .frame(height: 48)
                            .background(
                                GeometryReader { textGeometry in
                                    Color.clear
                                        .preference(
                                            key: TextWidthKey.self,
                                            value: [index: textGeometry.size.width]
                                        )
                                }
                            )
                            .onTapGesture {
                                tabSelection = index + 1
                            }
                    }
                }
                .frame(width: geometry.size.width, height: 48, alignment: .leading)
                .onPreferenceChange(TextWidthKey.self) { value in
                    textWidths = value
                }
                
                if let selectedWidth = textWidths[tabSelection - 1] {
                    Capsule()
                        .frame(width: selectedWidth, height: 6)
                        .foregroundColor(Color.theme.primaryColor)
                        .matchedGeometryEffect(id: "SelectedTab", in: animationNamespace)
                        .offset(x: calculateCapsuleXOffset(), y: geometry.size.height - 3)
                        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: tabSelection)
                }
            }
        }
        .frame(height: 48)
        .clipShape(Rectangle())
        .background(Color.clear)
    }
    
    private func calculateCapsuleXOffset() -> CGFloat {
        let totalSpacing: CGFloat = CGFloat(tabSelection - 1) * 16
        let previousWidths = (0..<(tabSelection - 1))
            .compactMap { textWidths[$0] }
            .reduce(0, +)
        return previousWidths + totalSpacing
    }
}

#Preview {
    VStack {
        CustomTabBar(tabSelection: .constant(1), tabBarItems: [
            TabBarItem(title: "All"),
            TabBarItem(title: "Announcement"),
            TabBarItem(title: "Promotion")
        ])
        
        CustomTabBar(tabSelection: .constant(1), tabBarItems: [
            TabBarItem(title: "All"),
            TabBarItem(title: "Top Up"),
            TabBarItem(title: "Charging")
        ])
    }
    .padding()
    .environment(\.colorScheme, .light)
}
