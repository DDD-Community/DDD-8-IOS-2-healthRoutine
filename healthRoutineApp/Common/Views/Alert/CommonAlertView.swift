//
//  CommonAlertView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import SwiftUI

struct CommonAlertView: View {
    
    var info: AlertorViewInfo
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 20) {
                
                Text(info.title)
                    .font(Font.pretendard(.bold, size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text(info.message)
                    .font(Font.pretendard(.medium, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                HStack {
                    
                    Spacer()
                    
                    Text(info.cancelTitle)
                        .font(Font.pretendard(.regular, size: 13))
                        .foregroundColor(.black)
                        .padding(.horizontal, 23)
                        .padding(.vertical, 13)
                        .background(Color.background_gray)
                        .cornerRadius(10)
                        .onTapGesture {
                            self.info.cancelCompletion?()
                        }
                    
                    Text(info.okTitle)
                        .font(Font.pretendard(.regular, size: 13))
                        .foregroundColor(.black)
                        .padding(.horizontal, 23)
                        .padding(.vertical, 13)
                        .background(Color.main_green)
                        .cornerRadius(10)
                        .onTapGesture {
                            self.info.okCompletion?()
                        }
                }
            }
            .padding(24)
            .cornerRadius(16)
            .background(Color.box_color)
            .cornerRadius(16)
            .padding(24)
        }
    }
}

struct CommonAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CommonAlertView(info: AlertorViewInfo(title: "회원탈퇴", message: "정말 우리를 떠나실건가요?\n탈퇴 후 회원 정보는 복구가 불가능해요.", okTitle: "회원탈퇴", cancelTitle: "취소", okCompletion: nil, cancelCompletion: nil))
            .blur(radius: 0)
    }
}
