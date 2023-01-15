//
//  ReportDetailKindView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailKindView: View {
    
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
    
        LazyVStack {
            
            Text("운동 종류를 선택해주세요")
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 6) {
                
                // Sample Data
                ForEach(ExPart.allCases, id: \.self) {
                    
                    Text($0.localized)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 14)
                        .background(Color(.systemGray4))
                        .cornerRadius(15)
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
