//
//  MyPageDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import SwiftUI

struct MyPageDetailView: View {
    
    @State var showingSheet: Bool = false
    @State var openAlbum: Bool = false
    
    var body: some View {
        
        VStack {
            
            MyPageDetailProfileModifyView()
                .frame(maxWidth: .infinity, minHeight: 250)
                .background(.red)
                .cornerRadius(20)
            
            Button("수정하기") {
                
            }
            .buttonStyle(CommonButtonView())
            
            Spacer()
        }
        .padding()
    }
    
    private func actionSheet() -> ActionSheet {
        
        let albumButton = ActionSheet.Button.default(Text("앨범")) {
            
            UIView.setAnimationsEnabled(false)
            
            self.showingSheet = false
            self.openAlbum = true
        }
                
        let cancelButton = ActionSheet.Button.cancel(Text("취소"))
        let actionSheet = ActionSheet(title: Text("선택해주세요"),
                                      message: Text("촬영 또는 앨범을 선택해주세요"),
                                      buttons: [albumButton, cancelButton])
        return actionSheet
    }
}

struct MyPageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailView()
    }
}
