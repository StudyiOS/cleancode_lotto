//
//  View+.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import SwiftUI

extension View {
    func roundedBackground(color: Color, cornerRadius: CGFloat) -> some View {
        modifier(RoundedBackgroundModifier(color: color, cornerRadius: cornerRadius))
    }

    func circleBackground(color: Color, size: CGFloat) -> some View {
        modifier(CircleBackground(color: color, size: size))
    }
}

fileprivate struct RoundedBackgroundModifier: ViewModifier {
    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .padding()
    }
}

fileprivate struct CircleBackground: ViewModifier {
    let color: Color
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .background(color)
            .clipShape(Circle())
    }
}
