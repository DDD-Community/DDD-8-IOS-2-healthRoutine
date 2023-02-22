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
                
                HStack(alignment: .top, spacing: 24) {
                    
                    Text("무게")
                        .font(Font.pretendard(.bold, size: 16))           
                        .foregroundColor(.white_text)
                        .padding(.top, 8)

                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(title: "kg", value: $viewModel.weight)
                            .frame(maxWidth: .infinity)
                        ScrollView(.horizontal, showsIndicators: false) {

                            LazyHGrid(rows: columns, spacing: 6) {

                                ForEach(ExWeight.allCases, id: \.self) { weight in

                                    Button {
                                        let value = viewModel.weight.toInt() + weight.rawValue
                                        viewModel.weight = String(value)
                                    } label : {
                                        Text(weight.localized)
                                            .font(Font.pretendard(.semiBold, size: 13))
                                            .padding(.horizontal, 12.5)
                                            .padding(.vertical, 9.5)
                                            .foregroundColor(.background_black)
                                            .background(Color.white_text)
                                            .cornerRadius(30)
                                    }
                                }
                            }
                        }
                    }
                }
                
                HStack(alignment: .top, spacing: 24) {

                    Text("횟수")
                        .font(Font.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                        .padding(.top, 8)

                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(title: "번", value: $viewModel.count)
                            .frame(maxWidth: .infinity)

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: columns, spacing: 6) {
                                ForEach(ExCount.allCases, id: \.self) { count in

                                    Button {
                                        let value = viewModel.count.toInt() + count.rawValue
                                        viewModel.count = String(value)
                                    } label : {
                                        Text(count.localized)
                                            .font(Font.pretendard(.semiBold, size: 13))
                                            .padding(.horizontal, 12.5)
                                            .padding(.vertical, 9.5)
                                            .foregroundColor(.background_black)
                                            .background(Color.white_text)
                                            .cornerRadius(30)
                                    }
                                }
                            }
                        }
                    }
                }
                
                HStack(alignment: .top, spacing: 24) {

                    Text("세트")
                        .font(Font.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                    
                    VStack(alignment: .leading) {
                        
                        ReportDetailDiffRowView(title: "세트", value: $viewModel.set)
                            .frame(maxWidth: .infinity)

                        ScrollView(.horizontal, showsIndicators: false) {

                            LazyHGrid(rows: columns, spacing: 6) {

                                ForEach(ExSet.allCases, id: \.self) { exerciseSet in

                                    Button {
                                        let value = viewModel.set.toInt() + exerciseSet.rawValue
                                        viewModel.set = String(value)
                                    } label : {
                                        Text(exerciseSet.localized)
                                            .font(Font.pretendard(.semiBold, size: 13))
                                            .padding(.horizontal, 12.5)
                                            .padding(.vertical, 9.5)
                                            .foregroundColor(.background_black)
                                            .background(Color.white_text)
                                            .cornerRadius(30)
                                    }
                                }
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
    
    var title: String
    var unit: String = ""
    
    @Binding var value: String
    
    var body: some View {
        
        VStack {
            
            HStack {
            
                VStack {
                    
                    TextField("", text: $value)
                        .foregroundColor(Color.main_green)
                        .font(Font.pretendard(.bold, size: 24))
                        .keyboardType(.decimalPad)
                        
                    Divider()
                        .frame(height: 2)
                        .background(value.isValid ? Color.main_green : .white_text)
                }
                
                Text(title)
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
