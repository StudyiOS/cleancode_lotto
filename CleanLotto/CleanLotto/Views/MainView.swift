//
//  ContentView.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        List {
            Section {
                GameNumberPicker(selectedGameNumber: $viewModel.state.selectGameNumber)
                
                buildSelectButton
            }
        }
        .sheet(isPresented: $viewModel.showResult) {
            buildResultModalView
        }
    }
    
    @ViewBuilder
    var buildSelectButton: some View {
        Button {
            viewModel.bindAction(.startSearch)
        } label: {
            Text("조회하기")
                .bold()
        }
    }
    
    @ViewBuilder
    var buildResultModalView: some View {
        ResultView(lottoResult: viewModel.state.lottoResult ?? Lotto.mockData)
    }
}

#Preview {
    MainView(viewModel: MainViewModel(dataFetcher: MockLottoFetcher()))
}
