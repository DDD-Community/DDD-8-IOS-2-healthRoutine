//
//  ReportDetailPartView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import SwiftUI

struct ReportDetailPartView: View {
    
    @State var selected: String?
    
    private let columns = [
        GridItem(.flexible()),GridItem(.flexible()),
        GridItem(.flexible()),GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            
            Text("운동 부위를 선택해주세요")
                .foregroundColor(.white_text)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 6) {
                
                ForEach(ExPart.allCases, id: \.self) { part in
                    
                    Button(action: { self.selected = part.localized }) {
                        
                        Text(part.localized)
                            .font(Font.pretendard(.semiBold, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .foregroundColor(.background_black)
                            .background(selected == part.localized ? Color.main_green : Color.background_gray)
                            .cornerRadius(15)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 170)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
    }
}

struct ReportDetailPartView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailPartView()
    }
}
