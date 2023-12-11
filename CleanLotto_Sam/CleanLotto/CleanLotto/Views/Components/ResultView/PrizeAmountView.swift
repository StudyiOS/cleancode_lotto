//
//  PrizeAmountView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct PrizeAmountView: View {
    let prizeAmount: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Text("1등 상금")
                .font(.system(size: 16))
                .padding(1)
            
            Text("\(prizeAmount)원")
                .bold()
                .font(.system(size: 24))
        }
    }
}

#Preview {
    PrizeAmountView(prizeAmount: 123412444)
}
