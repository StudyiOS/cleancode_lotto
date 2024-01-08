//
//  WinningRoundPicker.swift
//  CleanLotto
//
//  Created by Leo on 12/11/23.
//

import SwiftUI

extension MainView {
    func drawWinningRoundPickerSection(with winningRound: Binding<Int>) -> some View {
        VStack {
            drawWinningRoundPickerHeader()
            drawWinningRoundPicker(with: winningRound)
        }
        .padding(.top)
    }

    private func drawWinningRoundPickerHeader() -> Text {
        Text("당첨 회차")
            .bold()
    }

    private func drawWinningRoundPicker(with winningRound: Binding<Int>) -> some View {
        Picker("당첨 회차를 선택하세요.", selection: winningRound) {
            ForEach(1...1097, id: \.self) {
                Text($0.toString())
                    .foregroundStyle(.white)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 150)
    }
}

#Preview {
    MainView(viewModel: .init())
}
