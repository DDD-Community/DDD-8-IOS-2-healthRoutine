//
//  ReportDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        BaseView {
            
            ScrollView {
                
                VStack(spacing: 16) {
                    ReportDetailPartView()
                    ReportDetailKindView()
                    ReportDetailDiffView()
                }
            }
           
            BottomButton_BackView(buttonTitle: "운동기록 추가하기", isable: true) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView()
    }
}
