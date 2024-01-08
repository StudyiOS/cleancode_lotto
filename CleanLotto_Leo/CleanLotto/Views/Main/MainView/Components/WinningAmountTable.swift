//
//  WinningAmountTable.swift
//  CleanLotto
//
//  Created by Leo on 12/11/23.
//

import SwiftUI

extension MainView {
    func drawWinningAmountTableSection(with lotto: WinningLotto) -> some View {
        VStack(spacing: 0) {
            drawWinningTableHeader()
            drawWinningTableBody(with: lotto)
        }
        .frame(maxWidth: .infinity)
        .border(.white.opacity(0.3), width: 0.5)
    }

    private func drawWinningTableHeader() -> some View {
        Text("1등 총 당첨금")
            .font(.headline.bold())
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.tableHeaderBackground)
            .border(.white.opacity(0.3), width: 0.5)
    }

    private func drawWinningTableBody(with lotto: WinningLotto) -> some View {
        let totalAmount = lotto.firstWinnerTotalAmount
            .cutOffHundreadMillion()
            .toString()
        let winnerAmount = lotto.firstWinnerAmount
            .cutOffHundreadMillion()
            .toString()
        let winnerCount = lotto.firstWinners.toString()
        let winnerSubText = "(\(winnerCount)명 / \(winnerAmount)억)"

        return HStack(spacing: 4) {
            Text(totalAmount + "억원")
                .font(.title2.bold())

            Text(winnerSubText)
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    MainView(viewModel: .init())
}
