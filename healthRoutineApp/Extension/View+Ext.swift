//
//  View+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/20.
//

import Foundation
import SwiftUI

extension View {
    typealias ContentTransform<Content: View> = (Self) -> Content
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    @ViewBuilder func conditionalModifier<TrueContent: View, FalseContent: View> (_ condition: Bool, ifTrue: ContentTransform<TrueContent>, ifFalse: ContentTransform<FalseContent>) -> some View {
        if condition {
            ifTrue(self)
        } else {
            ifFalse(self)
        }
    }
}
