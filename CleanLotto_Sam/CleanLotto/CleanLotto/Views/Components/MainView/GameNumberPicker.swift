//
//  GameNumberPicker.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct GameNumberPicker: View {
    @Binding var selectedGameNumber: Int
    
    var body: some View {
        VStack {
            Picker("회차 선택", selection: $selectedGameNumber) {
                ForEach(LottoManager.shared.drawNumberList, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.wheel)
        }
    }
}
