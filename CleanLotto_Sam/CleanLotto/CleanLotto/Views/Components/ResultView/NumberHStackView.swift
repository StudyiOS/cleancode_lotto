//
//  NumberHStackView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct NumberHStackView: View {
    let numbers: [Int]
    private let colors: [Color] = [.lottoYellow, .lottoBlue, .lottoBlue, .lottoBlue, .lottoRed, .lottoGreen]
    
    var body: some View {
        HStack {
            ForEach(numbers.indices, id: \.self) {
                NumberCircleView(number: numbers[$0],
                                 color: colors[$0])
            }
        }
        .padding()
        .background(Color.init(uiColor: .systemGray6))
    }
}

#Preview {
    NumberHStackView(numbers: Lotto.mockData.drawNumbers)
}
