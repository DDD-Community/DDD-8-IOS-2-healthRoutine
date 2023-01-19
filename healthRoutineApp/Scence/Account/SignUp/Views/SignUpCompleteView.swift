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
            VStack(alignment: .center) {
                Text("Let's get \nStarted!")
                    .font(Font.pretendard(.bold, size: 36))
                    .foregroundColor(.main_green)
                    .multilineTextAlignment(.center)
                    .padding(.top, 91)

                Image("signup_complete")
                    .resizable()
                    .frame(width: 320, height: 294)
                    .padding(.top, 30)

                Text("회원가입이 완료되었습니다!\n득근득근과 힘차게 시작해볼까요?")
                    .font(Font.pretendard(.bold, size: 18))
                    .foregroundColor(.white_text)
                    .multilineTextAlignment(.center)
                    .padding(.top, 13)

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
