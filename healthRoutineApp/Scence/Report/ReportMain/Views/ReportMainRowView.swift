//
//  ReportMainRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportMainRowView: View {
    
    var item: TodayExerciseListResult
    var deleteClosure: StringClosure?

    @State var offset = CGSize.zero
    @State var deleteButton: Bool = false

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: -22) {
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 54, height: 54)
                        .overlay {
                            Text(item.categorySubject)
                                .font(Font.pretendard(.bold, size: 14))
                                .foregroundColor(.black)
                        }
                        .foregroundColor(.background_gray)
                        .cornerRadius(10)

                    VStack(alignment: .leading) {

                        Text(item.exerciseSubject)
                            .font(Font.pretendard(.semiBold, size: 14))
                            .foregroundColor(.white_text)

                        HStack {
                            
                            Text(item.getInfoStr())
                                .font(Font.pretendard(.semiBold, size: 14))
                                .foregroundColor(.white_text)
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 12)
                .frame(width: geo.size.width,  height: geo.size.height, alignment: .leading)
                .background(Color.background_gray3)
                .cornerRadius(10)
                .zIndex(1)

                // 삭제버튼
                if deleteButton {
                    ZStack {
                        Image("trash")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 16)
                    .frame(width: 66, height: geo.size.height)
                    .background(Color.error_red)
                    .cornerRadius(10)
                    .onTapGesture {
                        deleteClosure?(item.id)
                    }
                }
            }
            .frame(width: geo.size.width,  height: geo.size.height, alignment: .leading)
            .offset(self.offset)
            .animation(.spring(), value: self.offset.width)
            .gesture(DragGesture()
                .onChanged { gestrue in
                    self.offset.width = gestrue.translation.width
                    self.deleteButton = self.offset.width < 0 ? true : false
                }
                .onEnded { _ in
                    if self.offset.width <= -44 {
                        self.offset.width = -44
                        self.deleteButton = true
                    } else {
                        self.offset = .zero
                        self.deleteButton = false
                    }
                }
            )
        }
    }
}

struct ReportRowView: View {
    
    @State var item: TodayExerciseListResult
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Rectangle()
                .frame(width: 54, height: 54)
                .overlay {
                    Text(item.categorySubject)
                        .font(Font.pretendard(.bold, size: 14))
                        .foregroundColor(.black)
                }
                .foregroundColor(.background_gray)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                
                Text(item.exerciseSubject)
                    .font(Font.pretendard(.semiBold, size: 14))
                    .foregroundColor(.white_text)
                
                HStack {
                    
                    Text(item.getInfoStr())
                        .font(Font.pretendard(.semiBold, size: 14))
                        .foregroundColor(.white_text)
                }
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .background(Color.background_gray3)
            .cornerRadius(10)
        }
    }
}


struct ReportMainRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMainRowView(item: TodayExerciseListResult(id: "1", exerciseSubject: "스쿼트", categorySubject: "하체", weight: 10, reps: 15, set: 5))
    }
}
