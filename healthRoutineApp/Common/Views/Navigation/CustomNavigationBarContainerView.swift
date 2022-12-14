//
//  CustomNavigationBarContainerView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            CustomNavigationBarView(showBackButton: showBackButton, title: title)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavigationBarTitlePreferenceKey.self) { self.title = $0 }
        .onPreferenceChange(CustomNavigationBarBackButtonHiddenPreferenceKey.self) { self.showBackButton = !$0 }
    }
}

struct CustomNavigationBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarContainerView {
            ZStack {
                
                Color.gray.ignoresSafeArea()
                
                Text("Hello World!")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
