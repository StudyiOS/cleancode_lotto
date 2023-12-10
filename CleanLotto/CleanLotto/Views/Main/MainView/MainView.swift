//
//  MainView.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import SwiftUI

// 로또 6/45
// Divider
// 타이틀
// 날짜
// 번호
// 당첨금 테이블
// 피커

struct MainView: View {
    @StateObject var viewModel: MainViewModel

    var body: some View {
        Group {
            if let lotto = viewModel.lotto {
                VStack {
                    drawHeaderSection()
                    divider()
                    drawTitleSection(round: lotto.round, date: lotto.date)
                    drawNumberSection(numbers: lotto.numbers, bonusNumber: lotto.bonusNumber)
                    drawAmountTable(with: lotto)
                }
                .padding()
            } else {
                Text("로딩중")
            }
        }
        .foregroundStyle(Color.text)
        .roundedBackground(color: Color.background, cornerRadius: 20)
    }
}

fileprivate extension MainView {
    func drawHeaderSection() -> some View {
        Text("로또 6/45")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate extension MainView {
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

fileprivate extension MainView {
    func drawNumberSection(numbers: [Int], bonusNumber: Int) -> some View {
        HStack {
            ForEach(numbers, id: \.self) { number in
                drawNumberCell(with: number)
            }
            drawPlusAndBonusCell(with: bonusNumber)
        }
        .padding(.bottom, 20)
    }

    func drawNumberCell(with number: Int) -> some View {
        let CIRCLE_SIZE = 30.0
        let backgroundColor = Color.getBallBackgroundColor(in: number)

        return Text(number.toString())
            .font(.body.bold())
            .circleBackground(color: backgroundColor, size: CIRCLE_SIZE)
    }

    func drawPlusAndBonusCell(with number: Int) -> some View {
        HStack {
            Text("+")
                .font(.title)

            drawNumberCell(with: number)
        }
    }
}

fileprivate extension MainView {
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

fileprivate extension MainView {
    func divider() -> some View {
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
