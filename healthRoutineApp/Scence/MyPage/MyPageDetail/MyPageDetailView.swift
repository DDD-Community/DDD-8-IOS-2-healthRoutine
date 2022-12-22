//
//  MyPageDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailView: View {
    
    var body: some View {
        
        VStack {
            
            MyPageDetailProfileModifyView()
                .frame(maxWidth: .infinity, minHeight: 250)
                .background(.red)
                .cornerRadius(20)
            
            Button("수정하기") {
                
            }
            .buttonStyle(CommonButtonView())
            
            Spacer()
        }
        .padding()
    }
}

struct MyPageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailView()
    }
}
