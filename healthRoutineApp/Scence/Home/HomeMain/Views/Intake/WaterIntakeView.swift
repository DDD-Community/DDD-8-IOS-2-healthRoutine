//
//  WaterIntakeView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/25.
//

import SwiftUI
import FLAnimatedImage

struct WaterIntakeView: View {
    
    @ObservedObject private var viewModel = WaterIntakeViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text("오늘은 얼마나 마셧나요?")
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .center) {
                
                Image("minus")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.viewModel.minusAmount()
                    }
                
                GIFView(name: self.viewModel.gifName)
                    .frame(maxWidth: .infinity, maxHeight: 51)
                    .overlay {
                        Text("\(self.viewModel.waterAmount) ml")
                            .font(Font.pretendard(.bold, size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                
                Image("plus")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.viewModel.plusAmount()
                    }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 135)
        .background(Color.box_color)
        .cornerRadius(16)
        .onAppear { self.viewModel.fetchInfos() }
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
