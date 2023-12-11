//
//  ResultHeaderView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct ResultHeaderView: View {
    var lotto: Lotto
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("\(lotto.drwNo)회")
                    .bold()
                    .foregroundStyle(.red)
                    .font(.system(size: 24))
                Text("당첨 결과")
                    .font(.system(size: 24))
            }
            
            Text("추첨 날짜: \(lotto.drwNoDate)")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ResultHeaderView(lotto: Lotto.mockData)
}
