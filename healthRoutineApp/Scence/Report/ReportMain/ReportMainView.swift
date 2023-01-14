//
//  ReportMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainView: View {
    
    var body: some View {
        
        CustomNavigationView {
            
            BaseView {
                
                ScrollView {
                    
                    LazyVStack(spacing: 10) {
                        
                        Text("오늘은 어떤 운동을 하셨나요?")
                            .foregroundColor(.white)
                            .font(Font.pretendard(.bold, size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 16)
                        
                        List {
                            ReportMainRowView()
                            ReportMainRowView()
                            ReportMainRowView()
                        }
                    }
                    .padding(24)
                    .background(Color.box_color)
                    .cornerRadius(10)
                }
               

                CustomNavigationLink(destination: ReportDetailView().customNavigationTitle("기록")) {
                    BottomButton_BackView(buttonTitle: "운동기록 추가하기", isable: true)
                }
                .customNavigationTitle("기록")
                .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}

struct ReportMainView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainView()
    }
}
