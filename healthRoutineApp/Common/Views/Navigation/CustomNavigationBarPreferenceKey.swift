//
//  CustomNavigationBarPreferenceKey.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import SwiftUI

struct CustomNavigationBarTitlePreferenceKey: PreferenceKey {

    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavigationBarBackButtonHiddenPreferenceKey: PreferenceKey {

    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
    func customNavigationTitle(_ title: String?) -> some View {
        self.preference(key: CustomNavigationBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        self.preference(key: CustomNavigationBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationBarItems(title: String? = nil, backButtonHidden: Bool = false) -> some View {
        self.customNavigationTitle(title)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
