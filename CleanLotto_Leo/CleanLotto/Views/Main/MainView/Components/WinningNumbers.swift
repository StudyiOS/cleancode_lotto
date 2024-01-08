//
//  WinningNumbers.swift
//  CleanLotto
//
//  Created by Leo on 12/11/23.
//

import SwiftUI

extension MainView {
    func drawWinningNumberSection(numbers: [Int], bonusNumber: Int) -> some View {
        HStack {
            ForEach(numbers, id: \.self) { number in
                drawNumberCell(with: number)
            }
            drawPlusAndBonusCell(with: bonusNumber)
        }
        .padding(.bottom, 20)
    }

    private func drawNumberCell(with number: Int) -> some View {
        let CIRCLE_SIZE = 30.0
        let backgroundColor = Color.getBallBackgroundColor(in: number)

        return Text(number.toString())
            .font(.body.bold())
            .circleBackground(color: backgroundColor, size: CIRCLE_SIZE)
    }

    private func drawPlusAndBonusCell(with number: Int) -> some View {
        HStack {
            Text("+")
                .font(.title)

            drawNumberCell(with: number)
        }
    }
}

#Preview {
    MainView(viewModel: .init())
}

