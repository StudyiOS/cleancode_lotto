//
//  MainViewHeader.swift
//  CleanLotto
//
//  Created by Leo on 12/11/23.
//

import SwiftUI

extension MainView {
    func drawHeaderSection() -> some View {
        VStack {
            drawHeaderText()
            divider()
        }
    }

    private func drawHeaderText() -> some View {
        Text("로또 6/45")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func divider() -> some View {
        Spacer()
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            .background(.white)
            .padding(.vertical, 20)
    }
}

#Preview {
    MainView(viewModel: .init())
}
