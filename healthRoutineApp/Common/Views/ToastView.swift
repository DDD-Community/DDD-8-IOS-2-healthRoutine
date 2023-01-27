//
//  ToastView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/27.
//

import SwiftUI

struct ToastView: View {
    
    var title: String
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(title)
                .font(Font.pretendard(.semiBold, size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 46)
                .background(Color.gray_888)
                .cornerRadius(10)
                .padding(20)
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(title: "수정이 완료되었습니다.")
    }
}
