//
//  ClearBackgroundView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/27.
//

import Foundation
import SwiftUI

struct ClearBackgroundView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    private class InnerView: UIView {
        
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
    }
}
