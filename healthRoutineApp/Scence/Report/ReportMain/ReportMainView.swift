//
//  ReportMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainView: View {
    
    @ObservedObject private var viewModel = ReportViewModel()
    
    var body: some View {
        
        CustomNavigationView {
            
            BaseView {

                VStack {
                    ScrollView {

                        VStack(spacing: 10) {

                            Text(viewModel.titleStr)
                                .foregroundColor(.white)
                                .font(Font.pretendard(.bold, size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            ForEach(viewModel.exerciseArray, id: \.self) { item in
                                ReportMainRowView(item: item) { id in
                                    viewModel.deleteReport(id)
                                }.frame(height: 74)
                            }
                        }
                        .padding(24)
                        .background(Color.box_color)
                        .cornerRadius(10)
                    }

                    CustomNavigationLink(destination: ReportDetailView(viewModel: viewModel.getDetailViewModel()).customNavigationTitle("")) {
                        BottomButton_BackView(buttonTitle: "운동기록 추가하기", isable: true, preventButtonAction: true)
                    }
                    .frame(height: 84)
                    .customNavigationTitle("기록")
                    .customNavigationBarBackButtonHidden(true)
                }
                .onAppear { viewModel.fetchList() }
            }
        }
    }
}

struct ReportMainView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainView()
    }
}
