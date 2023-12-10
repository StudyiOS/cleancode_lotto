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
#Preview {
    MainView(viewModel: .init())
}
