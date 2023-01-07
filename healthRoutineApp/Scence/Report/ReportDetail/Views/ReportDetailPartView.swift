//
//  ReportDetailPartView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import SwiftUI

struct ReportDetailPartView: View {
    
    @State var isSelected: Bool = false
    
    private enum Colors {
        static let unSelected: Color = Color.background_gray2
        static let selected: Color = Color.white
    }
    
    enum Const {
        static var prototype: [String] = ["123123", "123123", "123123", "123123", "123123", "123123", "123123", "123123" ]
    }
  
    var body: some View {

        VStack {
            
            Text("운동 부위를 입력해주세요")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
//            Const.prototype.map {
//
//                Text($0)
//                    .lineLimit(1)
//                    .foregroundColor(.black)
//                    .font(Font.pretendard(.medium, size: 16))
//                    .frame(maxWidth: .infinity, maxHeight: 40)
//                    .padding(.horizontal, 20)
//                    .background(isSelected ? Colors.selected : Colors.unSelected)
//                    .cornerRadius(30)
//            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 170)
        .background(.red)
        .cornerRadius(16)
    }
}



struct ReportDetailPartView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailPartView()
    }
}
