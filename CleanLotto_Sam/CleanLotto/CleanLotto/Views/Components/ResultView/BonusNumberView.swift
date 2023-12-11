//
//  BonusNumberView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct BonusNumberView: View {
    let bonusNumber: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Text("보너스")
                .font(.system(size: 20))
                .padding()
            
            HStack() {
                Text("+")
                    .font(.system(size: 26))
                    .bold()
                    .foregroundStyle(.black)
                
                NumberCircleView(number: bonusNumber,
                                 color: .lottoGray)
            }
            .padding()
            .background(Color.init(uiColor: .systemGray6))
        }
    }
}

#Preview {
    BonusNumberView(bonusNumber: 1)
}
