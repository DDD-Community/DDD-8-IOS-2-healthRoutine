//
//  ReportDetailKindView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/07.
//

import SwiftUI

struct ReportDetailKindView: View {

    @Binding var selectedExercise: DI_Exercise?

    @State var isPresentPopup: Bool = false

    private let columns = [GridItem(.flexible()),GridItem(.flexible())]

    @ObservedObject var viewModel: ReportDetailViewModel

    var body: some View {

        LazyVStack {
            
            Text("운동 종류를 선택해주세요")
                .foregroundColor(.white)
                .font(Font.pretendard(.semiBold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            if viewModel.selectedCategory != nil {
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

                    ReportDetailPopupView(viewModel: self.viewModel, value: "")
                        .background(ClearBackgroundView())
                }
                .onAppear { UIView.setAnimationsEnabled(false) }
            }

            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(viewModel.selectedCategory?.exercise.prefix(6) ?? [], id: \.self) { exercise in
                    HStack(alignment: .center, spacing: 3) {
                        Text(exercise.subject)
                            .font(Font.pretendard(.semiBold, size: 12))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.background_black)

                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .onTapGesture {
                                self.viewModel.deleteCustomExercise(exercise.id)
                            }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                    .background(selectedExercise == exercise ? Color.main_green : Color.background_gray)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.selectedExercise = exercise
                    }
                }
            }
        }
        .padding(20)
        .background(Color(hex: "272830"))
        .cornerRadius(16)
        .onDisappear { UIView.setAnimationsEnabled(true) }
    }
}
