//
//  ReportDetailPopupView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/28.
//

import SwiftUI
import Combine

struct ReportDetailPopupView: View {
    
    @ObservedObject var viewModel: ReportDetailViewModel

    @State var value: String = ""
    @Environment(\.presentationMode) var presentationMode

    let textLimit = 20
    
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
                    .onReceive(Just(value)) { _ in limitText(textLimit) }
                
                Divider()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .background(Color(hex: "FFFFFF"))
            }
            .padding(.bottom, 20)
            
            ScrollView(showsIndicators: true) {
                
                LazyVStack(spacing: 16) {
                    
                    ForEach(self.viewModel.selectedCategory?.exercise ?? [], id: \.self) { exercise in
                        
                        Button(action: { self.value = exercise.subject }) {
                            
                            Text(exercise.subject)
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
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                
                Text("추가하기")
                    .font(Font.pretendard(.regular, size: 13))
                    .foregroundColor(.black)
                    .padding(.horizontal, 23)
                    .padding(.vertical, 13)
                    .background(Color.main_green)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.viewModel.addCustomExercise(self.value)
                    }
            }
            
        }
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
        .onAppear {
            self.bindView()
        }
    }

    func limitText(_ upper: Int) {
        if value.count > upper {
            value = String(value.prefix(upper))
        }
    }

    private func bindView() {
        self.viewModel.customExerciseAddFinished
            .receive(on: RunLoop.main)
            .sink(receiveValue: { _ in
                self.presentationMode.wrappedValue.dismiss()
            })
            .store(in: &self.viewModel.cancellables)
    }
}
