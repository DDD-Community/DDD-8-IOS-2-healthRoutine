//
//  ReportMainRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainRowView: View {
        
    var body: some View {

        HStack() {
            
            Text("가슴")
                .foregroundColor(.black)
                .frame(width: 42, height: 42)
                .background(Color(hex:"C5C5C5"))
                .cornerRadius(21)
            
            Text("비하인드 숄더프레스")
                .foregroundColor(.black)
            
            Text("X2")
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 55)
        .padding(.horizontal, 12)
        .background(.white)
        .cornerRadius(50)
    }
}

struct ReportMainRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainRowView()
    }
}
