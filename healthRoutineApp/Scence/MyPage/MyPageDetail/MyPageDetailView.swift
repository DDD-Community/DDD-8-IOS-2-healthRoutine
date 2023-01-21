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
            
            VStack(spacing: 16) {
                
                MyPageDetailProfileModifyView()
                
                Button("수정 하기") {
                    
                }
                .buttonStyle(CommonButtonView())
                .background(Color(hex: "353535"))
                .cornerRadius(10)
                
                Spacer()
            }
        }
        .onAppear { self.bindView() }
    }
}

extension MyPageDetailView {
    
    private func bindView() {
        
        
    }
    
    private func bindInputs(_ inputs: MyPageDetailViewModelInputs) {
     
    }
    
    private func bindOutputs(_ outputs: MyPageDetailViewModelOutputs) {
        
        
    }
}

struct MyPageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailView()
    }
}
