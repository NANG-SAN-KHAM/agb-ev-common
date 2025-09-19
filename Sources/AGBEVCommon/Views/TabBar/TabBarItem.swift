//
//  TabBarItem.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/19/25.
//

import SwiftUI

public struct TabBarItem: Identifiable {
    public let id = UUID()
    public let title: LocalizedStringResource

    public init(title: LocalizedStringResource) {
        self.title = title
    }
}
