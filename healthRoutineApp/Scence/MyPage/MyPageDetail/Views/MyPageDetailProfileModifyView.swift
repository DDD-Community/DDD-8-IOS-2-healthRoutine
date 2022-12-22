//
//  MyPageDetailProfileModifyView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailProfileModifyView: View {
    
    @ObservedObject var viewModel = MyPageDetailProfileModifyViewModel()
    
    var body: some View {
        
        VStack {
            
            Circle()
                .fill(Color.blue)
                .frame(width: 132, height: 132)
                .overlay(Image(systemName: "arrow.up")
                                        .font(.title)
                                        .padding(),
                         alignment: .bottom)
            TextField("변경하실 닉네임을 입력해주세요", text: $viewModel.nickname)
            Divider()
        }
    }
}

struct MyPageDetailProfileModifyView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailProfileModifyView()
    }
}
