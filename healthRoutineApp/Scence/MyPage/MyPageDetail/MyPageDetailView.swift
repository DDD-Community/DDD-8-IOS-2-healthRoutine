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
        
        BaseView {
            
            VStack {
                
                MyPageDetailProfileModifyView()
                    .frame(maxWidth: .infinity, minHeight: 250)
                    .background(Color.box_color)
                    .cornerRadius(20)
                
                Button("수정하기") {
                    self.viewModel.updateInfo()
                }
                .buttonStyle(CommonButtonView())
                .background(Color(hex: "353535"))
                .cornerRadius(10)
                
                Spacer()
            }
        }
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
