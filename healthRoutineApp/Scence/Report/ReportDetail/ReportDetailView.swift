//
//  ReportDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportDetailView: View {
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack {
                    ReportDetailPartView()
                    ReportDetailKindView()
                    ReportDetailDiffView()
                }
            }
            
            BottomButtonView(buttonTitle: "운동기록 추가하기", isable: true)
        }
        .padding(.horizontal, 20)
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView()
    }
}
