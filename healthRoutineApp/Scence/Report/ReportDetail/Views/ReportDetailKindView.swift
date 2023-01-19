//
//  ReportDetailKindView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailKindView: View {

    @State var selected: String?
    
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var exPart: ExPart = .chest
    
    var body: some View {
    
        LazyVStack {
            
            Text("운동 종류를 선택해주세요")
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 6) {

                ForEach(ExPart.allCases, id: \.self) { part in

                    Button(action: { self.selected = part.localized }) {

                        Text(part.localized)
                            .font(Font.pretendard(.semiBold, size: 13))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 14)
                            .foregroundColor(.background_black)
                            .background(selected == part.localized ? Color.main_green : Color.background_gray)
                            .cornerRadius(15)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(20)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
    }
}

struct ReportDetailKindView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailKindView()
    }
}
