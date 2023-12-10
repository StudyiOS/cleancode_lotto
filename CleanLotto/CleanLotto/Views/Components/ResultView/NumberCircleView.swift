//
//  NumberCircleView.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import SwiftUI

struct NumberCircleView: View {
    let number: Int
    let color: Color
    
    var body: some View {
        Circle()
            .frame(width: 42)
            .foregroundStyle(color)
            .overlay {
                Text("\(number)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .font(.system(size: 21))
            }
    }
}

#Preview {
    NumberCircleView(number: 1, color: .green)
}
