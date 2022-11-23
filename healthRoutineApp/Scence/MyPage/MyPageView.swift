//
//  MyPageView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageView: View {
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Spacer().frame(height: 1)
            
            Text("마이페이지")
            
            Spacer()
            
            MyPageProfileView()
            
            Spacer()
            
            MyPageHistoryView()
            
            Spacer()
            
            MyPageBadgeView()
            
            Spacer().frame(height: 1)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
