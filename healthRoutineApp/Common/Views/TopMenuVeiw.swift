//
//  TopMenuVeiw.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct TopMenuVeiw: View {
    
    @State var mainTitle: String
    
    var body: some View {
        
        HStack {
            
            Text(mainTitle)
                .fontWeight(.bold)
                .font(.title)
            
            Spacer()
            
            Image(systemName: "bell")
        }
        .padding([.leading, .trailing], 20)
        
        Spacer()
    }
}

struct TopMenuVeiw_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuVeiw(mainTitle: "마이페이지")
    }
}
