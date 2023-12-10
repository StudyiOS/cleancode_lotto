//
//  ResultView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct ResultView: View {
//    @Binding var isPresented: Bool
    
    var lottoResult: Lotto
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            ResultHeaderView(lotto: lottoResult)

            NumberHStackView(numbers: lottoResult.drawNumbers)
            
            BonusNumberView(bonusNumber: lottoResult.bnusNo)

            Spacer()
            
            PrizeAmountView(prizeAmount: lottoResult.firstWinamnt)
            
            Spacer()
            
        }
        .padding()
    }
}
