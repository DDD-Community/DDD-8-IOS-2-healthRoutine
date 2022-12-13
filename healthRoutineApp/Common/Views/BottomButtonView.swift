//
//  BottomButtonView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct BottomButtonView: View {
    
    var buttonTitle: String
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Button(buttonTitle) {
                debugPrint("Button Action")
            }
            .buttonStyle(CommonButtonView())
            .frame(minHeight: 88)
//            .background(Color.yellow)
        }
//        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(buttonTitle: "버튼명")
    }
}
