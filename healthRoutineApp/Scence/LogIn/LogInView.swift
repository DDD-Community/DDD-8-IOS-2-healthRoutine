//
//  LogInView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/30.
//

import SwiftUI

struct LogInView: View {
    
    @State var id: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            InputView(title: "아이디", placeholder: "아이디를 입력해 주세요.", value: $id)
            InputView(title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", value: $password)
            
            Button("로그인") {
             
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .font(.body)
            .foregroundColor(.black)
            .background(Color(.systemGray4))
            .cornerRadius(20)
            
            Spacer()
        }
        .padding(.top, 100)
        .padding([.leading, .trailing], 20)
    }
}

struct InputView: View {

    var title: String
    var placeholder: String
    
    @Binding var value: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(title)
                Spacer()
            }
            
            TextField(placeholder, text: $value)
            Divider()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
