//
//  TopMenuVeiw.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct TopMenuVeiw: View {
    
    @State var mainTitle: String = ""
    var isMainView: Bool = true
    
    var body: some View {
        
        HStack {
            if isMainView {
                Text(mainTitle)
                    .fontWeight(.bold)
                    .font(.title)
            }
            else {
                Button(action: pop){
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            Image(systemName: "bell")
        }
        .padding([.leading, .trailing], 20)
        
        Spacer()
    }
    
    func pop() {
        // pop
    }
}

struct TopMenuVeiw_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuVeiw(mainTitle: "마이페이지")
    }
}
