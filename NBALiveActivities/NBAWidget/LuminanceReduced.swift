//
//  LuminanceReduced.swift
//  NBALiveActivities
//
//  Created by JerryLiu on 2022/10/13.
//

import Foundation
import SwiftUI

struct LuminanceReducedColor: ViewModifier {
    var foregroundColor: Color
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    func body(content: Content) -> some View {
        if isLuminanceReduced {
            content.foregroundColor(.white)
        } else {
            content.foregroundColor(foregroundColor)
        }
    }
}

extension View {
    func luminanceReducedColor(color: Color) -> some View {
        modifier(LuminanceReducedColor(foregroundColor: color))
    }
}

struct LuminanceReducedLinearGradientColor: ViewModifier {
    var foregroundColor: Color
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    func body(content: Content) -> some View {
        if isLuminanceReduced {
            content.foregroundStyle(.linearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
        } else {
            content.foregroundStyle(.linearGradient(colors: [foregroundColor, foregroundColor.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

extension View {
    func luminanceReducedLinearGradientColor(color: Color) -> some View {
        modifier(LuminanceReducedLinearGradientColor(foregroundColor: color))
    }
}
