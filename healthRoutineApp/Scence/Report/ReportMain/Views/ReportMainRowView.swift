//
//  ReportMainRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainRowView: View {
    
//    @State var exercise: Exercise
    
    var body: some View {

        HStack() {
            
            Text("가슴")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(.black)
                .cornerRadius(10)
            
            Text("비하인드 숄더프레스")
                .foregroundColor(.white)
            
            Text("X2")
                .foregroundColor(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 74)
        .padding(12)
        .background(.red)
        .cornerRadius(10)
    }
}
//
//struct ReportMainRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportMainRowView(exercise: . )
//    }
//}
