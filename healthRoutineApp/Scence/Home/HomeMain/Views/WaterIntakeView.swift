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
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
