//
//  BottomButton_BackView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/09.
//

import SwiftUI

struct BottomButton_BackView: View {
    
    var buttonTitle: String
    var isable: Bool
    var buttonAction: VoidClosure? = nil
    var preventButtonAction: Bool = false
    
    var body: some View {

        VStack {
            
            Spacer()
            
            VStack {

                Button(buttonTitle) {
                    buttonAction?()
                }
                .buttonStyle(CommonButtonView())
                .background(isable ? Color.main_green : Color.button_disabled)
                .foregroundColor(isable ? Color.background_black : Color.gray_888)
                .cornerRadius(10)
                .padding(.top, 24)
                .padding(.bottom, 24)
                .disabled(preventButtonAction ? true : !isable)
            }
            .frame(maxWidth: .infinity, maxHeight: 84)
            .padding(.horizontal, 20)
            .background(.white)
        }
    }
}

struct BottomButton_BackView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButton_BackView(buttonTitle: "버튼명", isable: true)
    }
}
