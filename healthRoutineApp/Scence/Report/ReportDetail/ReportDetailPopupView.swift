//
//  ReportDetailPopupView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/28.
//

import SwiftUI

struct ReportDetailPopupView: View {
    
    // 운동종류를 받아서 -> title, ScrollView 내부 값 변경하면 될 듯?
//    @Environment(\.dismiss) var dismiss
    @State var value: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("운동기록을 입력해주세요.")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("close")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding(.bottom, 24)
            
            VStack {
                
                TextField("", text: $value)
                    .placeholder(when: value.isEmpty) {
                        Text("직접입력")
                            .foregroundColor(Color.disabled_button_field)
                    }
                    .foregroundColor(Color(hex: "FFFFFF"))
                
                Divider()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .background(Color(hex: "FFFFFF"))
            }
            .padding(.bottom, 20)
            
            ScrollView(showsIndicators: true) {
                
                LazyVStack(spacing: 16) {
                    
                    ForEach(ExPart.allCases, id: \.self) { part in
                        
                        Button(action: { self.value = part.localized }) {
                            
                            Text(part.localized)
                                .foregroundColor(.black)
                                .font(Font.pretendard(.semiBold, size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
            }
            .frame(maxWidth: .infinity, maxHeight: 140)
            .background(.white)
            .cornerRadius(10)
            .padding(.bottom, 12)
            
            HStack {
                
                Spacer()
                
                Text("취소")
                    .font(Font.pretendard(.regular, size: 13))
                    .foregroundColor(.black)
                    .padding(.horizontal, 23)
                    .padding(.vertical, 13)
                    .background(Color.background_gray)
                    .cornerRadius(10)
                
                Text("추가하기")
                    .font(Font.pretendard(.regular, size: 13))
                    .foregroundColor(.black)
                    .padding(.horizontal, 23)
                    .padding(.vertical, 13)
                    .background(Color.main_green)
                    .cornerRadius(10)
            }
            
        }
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}

struct ReportDetailPopupView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailPopupView(value: "어깨")
    }
}
