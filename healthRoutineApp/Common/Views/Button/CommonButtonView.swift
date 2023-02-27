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
            .font(Font.pretendard(.bold, size: 18))
            .cornerRadius(10)
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Button("로그인") { }
        .buttonStyle(CommonButtonView())
    }
}
