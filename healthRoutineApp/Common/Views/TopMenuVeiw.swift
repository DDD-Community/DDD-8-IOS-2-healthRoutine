//
//  TopMenuVeiw.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct TopMenuVeiw: View {
    
    @State var mainTitle: String = ""
    
    var body: some View {
        
        HStack {
            
            Text(mainTitle)
                .font(Font.pretendard(.bold, size: 24))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.box_color)
        
        Spacer()
    }
}

struct TopMenuVeiw_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuVeiw(mainTitle: "마이페이지")
            .background(.red)
    }
}
