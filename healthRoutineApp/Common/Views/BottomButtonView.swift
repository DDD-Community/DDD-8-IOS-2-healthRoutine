//
//  BottomButtonView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct BottomButtonView: View {

    var buttonTitle: String
    var isable: Bool
    var buttonAction: VoidClosure? = nil
    var preventButtonAction: Bool = false
    var body: some View {

        VStack {

            Spacer()

            Button(buttonTitle) {
                buttonAction?()
            }
            .buttonStyle(CommonButtonView())
            .background(isable ? Color.main_green : Color.button_disabled)
            .foregroundColor(isable ? Color.background_black : Color.gray_888)
            .cornerRadius(10)
            .padding(.bottom, 24)
            .frame(maxWidth: .infinity, minHeight: 60)
            .disabled(preventButtonAction ? true : !isable)
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(buttonTitle: "버튼명", isable: true)
    }
}
