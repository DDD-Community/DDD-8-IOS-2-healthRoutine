//
//  MyPageDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailView: View {
    
    @ObservedObject var viewModel = MyPageDetailViewModel()
    
    var body: some View {
        
        VStack {
            
            MyPageDetailProfileModifyView()
                .frame(maxWidth: .infinity, minHeight: 250)
                .background(.red)
                .cornerRadius(20)
            
            Button("수정하기") {
                self.viewModel.updateInfo()
            }
            .buttonStyle(CommonButtonView())
            
            Spacer()
        }
        .padding()
        .onAppear { self.bindView() }
    }
    
    private func bindView() {
     
        self.viewModel.nickNameInfo
            .receive(on: RunLoop.main)
            .sink { isErr, hintText in
                print("isErr")
                print("hintText")
            }
            .store(in: &self.viewModel.cancellables)
    }
}

struct MyPageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailView()
    }
}
