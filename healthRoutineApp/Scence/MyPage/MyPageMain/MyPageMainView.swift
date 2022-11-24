//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                
                TopMenuVeiw(mainTitle: "마이페이지")
                MyPageProfileView()
                MyPageHistoryView()
                MyPageBadgeView()
            }
        }
        .padding(20)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
