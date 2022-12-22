//
//  MyPageMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/23.
//

import SwiftUI

struct MyPageMainView: View {
    
    var body: some View {
        
        CustomNavigationView {
            
            VStack {
                
                TopMenuVeiw(mainTitle: "마이페이지")
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .center) {
                        
                        MyPageProfileView()
                        MyPageHistoryView()
                        MyPageBadgeView()
                    }
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMainView()
    }
}
