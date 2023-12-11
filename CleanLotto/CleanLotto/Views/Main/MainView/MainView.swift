//
//  MainView.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    @State var winningRound: Int = MainViewModel.INITIAL_ROUND

    var body: some View {
        Group {
            if let lotto = viewModel.lotto {
                VStack {
                    drawHeaderSection()
                    drawTitleSection(round: lotto.round, date: lotto.date)
                    drawWinningNumberSection(numbers: lotto.numbers, bonusNumber: lotto.bonusNumber)
                    drawWinningAmountTableSection(with: lotto)
                    drawWinningRoundPickerSection(with: $winningRound)
                }
                .padding()
            } else {
                Text("Loading...")
            }
        }
        .foregroundStyle(Color.text)
        .roundedBackground(color: Color.background, cornerRadius: 20)
        .onChange(of: winningRound) {
            viewModel.selectedRound(to: winningRound)
        }
    }
}

#Preview {
    MainView(viewModel: .init())
}
