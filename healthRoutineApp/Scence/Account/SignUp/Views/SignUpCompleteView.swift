//
//  SignUpCompleteView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/25.
//

import SwiftUI

struct SignUpCompleteView: View {
    @EnvironmentObject private var viewRouter: ViewRouter
    var body: some View {
        BaseView {
            VStack {
                Text("회원가입 완료")
                    .padding(.top, 100)
                Spacer()

                BottomButtonView(buttonTitle: "메인으로 이동", isable: true) {
                    viewRouter.currentView = .home
                }
                .frame(maxHeight: 84) // 60 + 24
            }
        }
    }
}

struct SignUpCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCompleteView()
    }
}
