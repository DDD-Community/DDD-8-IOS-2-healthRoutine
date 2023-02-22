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
    }
    
    var body: some View {
        
        BaseView {
            VStack {

                ScrollView {

                    VStack(spacing: 16) {
                        ReportDetailPartView(categoryList: viewModel.categoryArray, selectedCategory: $viewModel.selectedCategory) // 부위
                        ReportDetailKindView(exerciseList: viewModel.selectedCategory?.exercise ?? [], selectedExercise: $viewModel.selectedExercise) // 종류
                        ReportDetailDiffView() // 상세
                    }
                }

                BottomButtonView(buttonTitle: "운동기록 추가하기", isable: viewModel.isAddAble) {
                    self.viewModel.addRepport()
                }
                .frame(height: 84)
            }
        }
        .onAppear {
            self.bindView()
        }
    }

    private func bindView() {
        self.viewModel.addFinished
            .receive(on: RunLoop.main)
            .sink(receiveValue: { _ in
                self.viewModel.delegate?.add()
                self.presentationMode.wrappedValue.dismiss()
            })
            .store(in: &self.viewModel.cancellables)

        self.viewModel.fetchList()
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView(viewModel: ReportDetailViewModel())
    }
}
