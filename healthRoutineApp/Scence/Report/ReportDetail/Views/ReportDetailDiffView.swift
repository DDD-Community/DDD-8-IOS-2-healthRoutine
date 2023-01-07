//
//  ReportDetailDiffView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailDiffView: View {
    
//    @State var value: String
    
    var body: some View {
        
        VStack {
            
            Text("운동 상세를 채워주세요.")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ReportDetailDiffRowView()
            ReportDetailDiffRowView()
            ReportDetailDiffRowView()
        }
    }
}

struct ReportDetailDiffRowView: View {
    
    var title: String = ""
    var unit: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .center) {
                
                Text("무게")
                
                Text("kg")
            }
        }
    }
}

struct ReportDetailDiffView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailDiffView()
    }
}
