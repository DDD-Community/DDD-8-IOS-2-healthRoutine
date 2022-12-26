//
//  BaseView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/26.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body : some View {
        ZStack {
            content
        }
        .padding([.leading, .trailing], 20)
        .background(Color.background_black)
        .ignoresSafeArea(.keyboard)
    }
}

