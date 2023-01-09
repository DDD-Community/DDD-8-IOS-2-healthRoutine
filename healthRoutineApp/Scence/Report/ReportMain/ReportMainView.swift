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
            VStack(spacing: 10) {
            
                Text("오늘은 어떤 운동을 하셨나요?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ReportMainRowView()
                ReportMainRowView()
                ReportMainRowView()
                ReportMainRowView()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .customNavigationBarBackButtonHidden(true)

//        .background(.yellow)
    }
}

struct ReportMainView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainView()
    }
}
