//
//  ReportDetailKindView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailKindView: View {

    @State var selected: String?
    @State var isPresentPopup: Bool = false
    
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var exPart: ExPart = .chest
    
    var body: some View {
    
        LazyVStack {
            
            Text("운동 종류를 선택해주세요")
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
                self.isPresentPopup.toggle()
                
            } label: {
                Text("추가하기 +")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .font(Font.pretendard(.semiBold, size: 14))
                    .foregroundColor(.white)
                    .background(Color.background_gray3)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isPresentPopup) {
                
                ReportDetailPopupView(value: "")
                    .background(ClearBackgroundView())
            }
            .onAppear { UIView.setAnimationsEnabled(false) }
            
//            LazyVGrid(columns: columns, spacing: 6) {
//
//                ForEach(ExPart.allCases, id: \.self) { part in
//
//                    Button(action: { self.selected = part.localized }) {
//
//                        HStack {
//                            
//                            Spacer()
//                            
//                            Text(part.localized)
//                                .font(Font.pretendard(.regular, size: 13))
//                                .frame(maxWidth: .infinity)
//                                .frame(height: 40)
//                                .lineLimit(2)
//                            
//                            Image("close")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 10, height: 10)
//                                .opacity(selected == part.localized ? 0 : 1)
//                        }
//                        .padding(.horizontal, 17)
//                        .foregroundColor(.background_black)
//                        .background(selected == part.localized ? Color.main_green : Color.background_gray)
//                        .cornerRadius(10)
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity)
        }
        .padding(20)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
    }
}

struct ReportDetailKindView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailKindView()
    }
}
