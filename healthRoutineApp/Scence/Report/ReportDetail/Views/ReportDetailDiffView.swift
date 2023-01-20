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
            
            LazyVStack(spacing: 34) {
                
                HStack(alignment: .top) {
                    
                    Text("무게")
                        .font(Font.pretendard(.bold, size: 16))           
                        .foregroundColor(.white_text)
                    
                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(value: $viewModel.set)
                            .frame(maxWidth: .infinity)
                        
                        LazyHGrid(rows: columns, spacing: 6) {
                            
                            ForEach(ExWeight.allCases, id: \.self) {
                                
                                Text($0.localized)
                                    .font(Font.pretendard(.semiBold, size: 13))
                                    .padding(.horizontal, 12.5)
                                    .padding(.vertical, 9.5)
                                    .background(Color(.systemGray4))
                                    .cornerRadius(30)
                            }
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    
                    Text("횟수")
                        .font(Font.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(value: $viewModel.set)
                            .frame(maxWidth: .infinity)
                        
                        LazyHGrid(rows: columns, spacing: 6) {
                            
                            ForEach(ExWeight.allCases, id: \.self) {
                                
                                Text($0.localized)
                                    .font(Font.pretendard(.semiBold, size: 13))
                                    .padding(.horizontal, 12.5)
                                    .padding(.vertical, 9.5)
                                    .background(Color(.systemGray4))
                                    .cornerRadius(30)
                            }
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    
                    Text("세트")
                        .font(Font.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(value: $viewModel.set)
                            .frame(maxWidth: .infinity)
                        
                        LazyHGrid(rows: columns, spacing: 6) {
                            
                            ForEach(ExSet.allCases, id: \.self) {
                                
                                Text($0.localized)
                                    .font(Font.pretendard(.semiBold, size: 13))
                                    .padding(.horizontal, 12.5)
                                    .padding(.vertical, 9.5)
                                    .background(Color(.systemGray4))
                                    .cornerRadius(30)
                            }
                        }
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
        
        VStack {
            
            HStack {
            
                VStack {
                    
                    TextField("", text: $value)
                        .foregroundColor(Color.main_green)
                        .font(Font.pretendard(.bold, size: 32))
                        
                    Divider()
                        .frame(height: 2)
                        .background(.white)
                }
                
                Text("kg")
                    .font(Font.pretendard(.semiBold, size: 14))
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
