//
//  CustomNavigationView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
//            BaseView {
                CustomNavigationBarContainerView {
                    content
//                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomNavigationView {
            Color.red.ignoresSafeArea()
        }
    }
}

// MARK: - Gesture
extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
    }
}
