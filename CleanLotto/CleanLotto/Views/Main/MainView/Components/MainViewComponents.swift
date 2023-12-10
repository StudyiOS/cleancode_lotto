//
//  MainViewComponents.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import SwiftUI

extension MainView {
    func drawHeaderSection() -> some View {
        Text("로또 6/45")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension MainView {
    func drawTitleSection(round: Int, date: String) -> some View {
        VStack {
            HStack {
                Text("\(round)회")
                    .font(.title.bold())

                Text("당첨결과")
                    .font(.title)
            }

            Text("(\(date) 추첨)")
                .font(.footnote)
        }
        .padding(.bottom, 32)
    }
}

extension MainView {
    func drawNumberSection(numbers: [Int], bonusNumber: Int) -> some View {
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

extension MainView {
    func drawAmountTable(with lotto: WinningLotto) -> some View {
        let totalAmount = lotto.firstWinnerTotalAmount
            .cutOffHundreadMillion()
            .toString()
        let winnerAmount = lotto.firstWinnerAmount
            .cutOffHundreadMillion()
            .toString()
        let winnerCount = lotto.firstWinners.toString()
        let winnerSubText = "(\(winnerCount)명 / \(winnerAmount)억)"

        return VStack(spacing: 0) {
            Text("1등 총 당첨금")
                .font(.headline.bold())
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.tableHeaderBackground)
                .border(.white.opacity(0.3), width: 0.5)

            HStack(spacing: 4) {
                Text(totalAmount + "억원")
                    .font(.title2.bold())

                Text(winnerSubText)
                    .font(.caption)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .border(.white.opacity(0.3), width: 0.5)
    }
}

extension MainView {
    func divider() -> some View {
        Spacer()
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            .background(.white)
            .padding(.vertical, 20)
    }
}
