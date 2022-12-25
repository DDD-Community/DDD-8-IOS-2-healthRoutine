//
//  SignUpCompleteView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/25.
//

import SwiftUI

struct SignUpCompleteView: View {
    var body: some View {
        VStack {
            Text("회원가입 완료")
                .padding(.top, 100)
            Spacer()
            CustomNavigationLink(destination: ContentView()
            ) {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(.system(size: 18, weight: .bold))
                    .background(Color(hex:"22ffaf"))
                    .foregroundColor(Color(hex:"18171d"))
                    .cornerRadius(10)
            }
        }
        .padding([.leading, .trailing], 20)
    }
}

struct SignUpCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCompleteView()
    }
}
