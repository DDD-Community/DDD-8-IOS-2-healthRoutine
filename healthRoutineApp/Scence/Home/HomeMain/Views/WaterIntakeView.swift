//
//  WaterIntakeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/25.
//

import SwiftUI

struct WaterIntakeView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("오늘은 얼마나 마셧나요?")
                .font(.system(size: 24, weight: .bold))
            
            HStack {
                
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.gray, .blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                
                Image(systemName: "plus")
                    .font(.system(size: 30, weight: .bold))
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(20)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 140)
        .cornerRadius(16)
        .padding(24)
        .background(Color.cyan)
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
