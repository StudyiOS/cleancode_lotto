//
//  MainViewWinningTitle.swift
//  CleanLotto
//
//  Created by Leo on 12/11/23.
//

import SwiftUI

extension MainView {
    func drawTitleSection(round: Int, date: String) -> some View {
        VStack {
            drawHeaderOfTitle(with: round)
            drawBodyOfTitle(with: date)
        }
        .padding(.bottom, 32)
    }

    private func drawHeaderOfTitle(with round: Int) -> some View {
        HStack {
            Text("\(round)회")
                .font(.title.bold())

            Text("당첨결과")
                .font(.title)
        }
    }
    
    private func drawBodyOfTitle(with date: String) -> Text {
        Text("(\(date) 추첨)")
            .font(.footnote)
    }
}

#Preview {
    MainView(viewModel: .init())
}
