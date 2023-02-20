//
//  ReportDetailKindView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailKindView: View {

    var exerciseList: [DI_Exercise] = []
    @State var selectedExercise: DI_Exercise?

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
            
            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(self.exerciseList, id: \.self) { exercise in
                    Button(action: {
                        self.selectedExercise = exercise
                    }) {

                        Text(exercise.subject)
                            .font(Font.pretendard(.semiBold, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .foregroundColor(.background_black)
                            .background(selectedExercise == exercise ? Color.main_green : Color.background_gray)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(20)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
    }
}
