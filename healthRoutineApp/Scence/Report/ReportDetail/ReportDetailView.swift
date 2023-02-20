//
//  ReportDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/05.
//

import SwiftUI

struct ReportDetailView: View {
    @ObservedObject var viewModel: ReportDetailViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: ReportDetailViewModel) {
        self.viewModel = viewModel
        self.viewModel.fetchList()
    }
    
    var body: some View {
        
        BaseView {
            VStack {

                ScrollView {

                    VStack(spacing: 16) {
                        ReportDetailPartView(categoryList: viewModel.categoryArray, selectedCategory: viewModel.selectedCategory) // 부위
                        ReportDetailKindView(exerciseList: viewModel.selectedCategory?.exerciseList ?? [], selectedExercise: viewModel.selectedExercise) // 종류
                        ReportDetailDiffView() // 상세
                    }
                }

                BottomButton_BackView(buttonTitle: "운동기록 추가하기", isable: true) {
                    self.viewModel.addRepport()
                    self.viewModel.delegate?.add()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .frame(height: 84)
            }
        }
        .onAppear { self.viewModel.fetchList() }
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView(viewModel: ReportDetailViewModel())
    }
}
