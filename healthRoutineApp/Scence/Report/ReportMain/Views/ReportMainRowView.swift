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
                .foregroundColor(.white)
                .frame(width: 42, height: 42)
                .background(.black)
                .cornerRadius(21)
            
            Text("비하인드 숄더프레스")
                .foregroundColor(.white)
            
            Text("X2")
                .foregroundColor(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 55)
        .padding(.horizontal, 12)
        .background(.red)
        .cornerRadius(50)
    }
}

struct ReportMainRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainRowView()
    }
}
