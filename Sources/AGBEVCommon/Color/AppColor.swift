//
//  AppColor.swift
//  AGBEVCommon
//
//  Created by NANG SAN KHAM on 9/18/25.
//

import SwiftUI
import AGBCommon

public struct AppColor: Sendable {
    // avail colors
    public let connectorAvailColors: [Color] = [
        Color(hex: "#11998E"),
        Color(hex: "#38EF7D")
    ]
    // unavail colors
    public let connectorUnAvailColors: [Color] = [
        Color(hex: "#D80034"),
        Color(hex: "#FF6700")
    ]
    // occupied colors
    public let connectorOccupiedColors: [Color] = [
        Color(hex: "#FDD924"),
        Color(hex: "#FF6700")
    ]
    // out of service colors
    public let connectorOutOfServiceColors: [Color] = [
        Color(hex: "#252525"),
        Color(hex: "#94A7B3")
    ]
    // gradient background
    public let gradientBackgroundColors: [Color] = [
        Color(hex: "#0D9563"),
        Color(hex: "#00A9AB")
    ]
    // payment provider disable background color
    public let paymentProviderDisableBgClr: Color = Color(hex: "#E7F0ED")
    // top up amount selected border color
    public let topUpAmountSelectedBorderColors: [Color] = [
        Color(hex: "#3AE180"),
        Color(hex: "#4DE48C")
    ]
    // error color
    public let red: Color = Color(hex: "#FF5454")
    // station search background color
    public let searchStationBgClr = Color(hex: "#E7EEF0")
    // dialog/sheet/alert mask background color
    let mask: Color = Color.black.opacity(0.3)
    //
    public let primaryEVTagClr = Color(hex: "#FF6700")
    
    public let boxBgClr = Color(hex: "#E7EEF0")
    // promo gradient text
    public let gradientPromoTxtClrs: [Color] = [
        Color(hex: "#78C885"),
        Color(hex: "#0D9563")
    ]
    
    public let btnBrandTextColor = Color(hex: "#6C6C70")
    public let btnBrandBgColor = Color(hex: "#F1F4F5")
    
    public let inActiveStepperColor = Color(hex: "#B8B8B8")
}
