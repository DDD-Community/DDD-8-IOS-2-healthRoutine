//
//  CustomNavigationBarView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let showBackButton: Bool
    let title: String?
    
    var body: some View {
        
        HStack {
            
            if showBackButton {
                backButton
            }
            
            titleSection
            
            Spacer()
            
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .foregroundColor(.black) // 색상 변경 여기서하면 됨.
        .font(.headline)
        .background(Color.background_black.ignoresSafeArea(edges: .top))
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            CustomNavigationBarView(showBackButton: true, title: "Text Title")
            Spacer()
        }
    }
}

extension CustomNavigationBarView {
    
    private var backButton: some View {
        
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
        }
    }
    
    private var titleSection: some View {
        
        VStack(spacing: 4) {
            
            if let title = title {
                Text(title)
                    .font(Font.pretendard(.semiBold, size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}
