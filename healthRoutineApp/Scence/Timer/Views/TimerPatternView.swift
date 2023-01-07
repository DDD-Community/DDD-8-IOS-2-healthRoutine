//
//  TimerPatternView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternView: View {
    
    @State var viewType: TimerPatternViewType
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text(viewType.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.pretendard(.bold, size: 20))
            
            LazyHGrid(rows: rows) {
                ForEach(viewType.getButtonArray(), id: \.self) { str in
                    TimerPatternButtonView(buttonTitle: str.buttonStr)
                }
            }
            .background(.red)
        }
        .frame(maxWidth: .infinity, minHeight: 183)
        .padding(.horizontal, 20)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}

struct TimerPatternView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternView(viewType: .exerciseTime)
    }
}
