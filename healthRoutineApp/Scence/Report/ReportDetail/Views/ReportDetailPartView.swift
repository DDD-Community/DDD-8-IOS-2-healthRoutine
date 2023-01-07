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
    
    var body: some View {
        
        Text("벤트 오버 리트렐 레이즈")
            .lineLimit(1)
            .foregroundColor(.black)
            .font(Font.pretendard(.medium, size: 16))
            .frame(maxWidth: .infinity, maxHeight: 40)
            .padding(.horizontal, 20)
            .background(isSelected ? Colors.selected : Colors.unSelected)
            .cornerRadius(30)
    }
}

struct ReportDetailPartView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailPartView()
    }
}
