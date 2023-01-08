//
//  ReportDetailDiffView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailDiffView: View {
    
    @ObservedObject private var viewModel = ReportDetailViewModel()
    
    private let columns = [GridItem(.flexible())]
    
    var body: some View {
        
        LazyVStack {
            
            Text("운동 상세를 입력해주세요")
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVStack {
                
                ReportDetailDiffRowView(value: $viewModel.set)
                
                LazyHGrid(rows: columns, spacing: 6) {
                    
                    // Sample Data
                    ForEach(ExWeight.allCases, id: \.self) {
                        
                        Text($0.localized)
                            .font(Font.pretendard(.regular, size: 13))
                            .padding(.horizontal, 10.5)
                            .padding(.vertical, 12.5)
                            .background(Color(.systemGray4))
                            .cornerRadius(30)
                    }
                }
                
                ReportDetailDiffRowView(value: $viewModel.weight)
                
                LazyHGrid(rows: columns, spacing: 6) {
                    
                    // Sample Data
                    ForEach(ExWeight.allCases, id: \.self) {
                        
                        Text($0.localized)
                            .font(Font.pretendard(.regular, size: 13))
                            .padding(.horizontal, 10.5)
                            .padding(.vertical, 12.5)
                            .background(Color(.systemGray4))
                            .cornerRadius(30)
                    }
                }
                
                ReportDetailDiffRowView(value: $viewModel.unit)
                
                LazyHGrid(rows: columns, spacing: 6) {
                    
                    // Sample Data
                    ForEach(ExSet.allCases, id: \.self) {
                        
                        Text($0.localized)
                            .font(Font.pretendard(.regular, size: 13))
                            .padding(.horizontal, 10.5)
                            .padding(.vertical, 12.5)
                            .background(Color(.systemGray4))
                            .cornerRadius(30)
                    }
                }
            }
            
        }
        .padding(20)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
    }
}

struct ReportDetailDiffRowView: View {
    
    var title: String = ""
    var unit: String = ""
    
    @Binding var value: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .center) {
                
                Text("무게")
                    .padding(.trailing, 24)
                    .foregroundColor(.white)
                
                VStack {
                    
                    TextField("", text: $value)
                        
                    Divider()
                        .frame(height: 2)
                        .background(.white)
                }
                
                Text("kg")
                    .padding(.leading, 8)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ReportDetailDiffView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailDiffView()
    }
}
