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
    @State var selectedRound: Int = 1095

    var body: some View {
        Group {
            if let lotto = viewModel.lotto {
                VStack {
                    drawHeaderSection()
                    divider()
                    drawTitleSection(round: lotto.round, date: lotto.date)
                    drawNumberSection(numbers: lotto.numbers, bonusNumber: lotto.bonusNumber)
                    drawAmountTable(with: lotto)
                    drawWinningRoundPicker()
                }
                .padding()
            } else {
                Text("로딩중")
            }
        }
        .foregroundStyle(Color.text)
        .roundedBackground(color: Color.background, cornerRadius: 20)
        .onChange(of: selectedRound) {
            viewModel.selectedRound(to: selectedRound)
        }
    }
}

extension MainView {
    func drawWinningRoundPicker() -> some View {
        VStack {
            Text("당첨 회차")
                .bold()

            Picker("당첨 회차를 선택하세요.", selection: $selectedRound) {
                ForEach(1...1097, id: \.self) {
                    Text($0.toString())
                        .foregroundStyle(.white)
                }
            }
            .labeledContentStyle(.automatic)
            .pickerStyle(.wheel)
            .frame(height: 150)
        }
        .padding(.top)
    }
}

#Preview {
    MainView(viewModel: .init())
}
