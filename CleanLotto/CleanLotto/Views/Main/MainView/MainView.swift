//
//  MainView.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            Text("Hello Lotto!")
            Text(viewModel.lotto?.date ?? "")
        }
        .padding()
    }
}

#Preview {
    MainView(viewModel: .init())
}
