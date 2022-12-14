//
//  CommonInputFieldView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct CommonInputFieldView: View {
    
    var title: String
    var placeholder: String
    var message: String?
    
    @Binding var isError: Bool
    @Binding var value: String
    
    var body: some View {
        
        VStack {
            
            Text(title)
            
            TextField(placeholder, text: $value)
            
            Divider()
            
            Text(message ?? "")
                .font(.system(size: 13, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(isError ? .red : .black)
        }
    }
}

struct CommonInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CommonInputFieldView(title: "아이디", placeholder: "이메일", message: "올바르지 않은 이메일 입니다", isError: .constant(false), value: .constant(""))
            .padding(20)
    }
}
