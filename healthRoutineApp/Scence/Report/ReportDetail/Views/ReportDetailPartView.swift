//
//  ReportDetailPartView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import SwiftUI

struct ReportDetailPartView: View {

    var categoryList: [DI_Category] = []

    @State var selectedCategory: DI_Category?
    
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
                
                ForEach(self.categoryList, id: \.self) { category in
                    
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        
                        Text(category.subject)
                            .font(Font.pretendard(.semiBold, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .foregroundColor(.background_black)
                            .background(selectedCategory == category ? Color.main_green : Color.background_gray)
                            .cornerRadius(10)
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
