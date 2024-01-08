//
//  CleanLottoApp.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import SwiftUI

@main
struct CleanLottoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: .init())
        }
    }
}
