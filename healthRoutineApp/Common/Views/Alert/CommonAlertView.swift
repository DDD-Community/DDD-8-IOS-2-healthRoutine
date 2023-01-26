//
//  CommonAlertView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import SwiftUI

struct CommonAlertView: View {
    
    var title: String = ""
    var message: String = ""
    
    var confirm: String = ""
    var cancel: String = ""
    
    var cancelAction: VoidClosure? = nil
    var confirmAction: VoidClosure? = nil
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text(title)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            Text(message)
                .font(Font.pretendard(.medium, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            HStack {

                Spacer()
                
                Text(cancel)
                    .font(Font.pretendard(.regular, size: 13))
                    .padding(.horizontal, 23)
                    .padding(.vertical, 13)
                    .background(Color.background_gray)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.confirmAction?()
                    }
                
                Text(confirm)
                    .font(Font.pretendard(.regular, size: 13))
                    .padding(.horizontal, 23)
                    .padding(.vertical, 13)
                    .background(Color.main_green)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.cancelAction?()
                    }
                
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .cornerRadius(16)
        .background(Color.box_color)
//        .cornerRadius(16)
//        .padding(24)
    }
}

struct CommonAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CommonAlertView()
    }
}
