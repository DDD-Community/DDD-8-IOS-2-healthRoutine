//
//  CommonButtonView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct CommonButtonView: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 60)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
            .background(Color(.darkGray))
            .cornerRadius(10)
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Button("로그인") {
            debugPrint("Button Action")
        }
        .buttonStyle(CommonButtonView())
    }
}
