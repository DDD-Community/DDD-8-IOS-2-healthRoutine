//
//  TimerDetailView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerAddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var timerData: TimerAddViewModel
    var body: some View {
        BaseView {
            VStack(spacing: 18.5) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        ForEach(TimerPatternViewType.allCases, id: \.self) { type in
                            TimerPatternView(viewType: type, timerData: timerData)
                        }
                    }
                }
                Button {
                    addTimer()
                } label: {
                    Text("타이머 추가하기")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(Font.pretendard(.bold, size: 18))
                        .background(timerData.isAvailableButton ? Color.main_green : Color.button_disabled)
                        .foregroundColor(timerData.isAvailableButton ? Color.background_black : Color.gray_888)
                        .cornerRadius(10)
                }
                .disabled(!timerData.isAvailableButton)
            }
        }
    }
    
    func addTimer() {
        self.timerData.addTimer()
        self.timerData.refresh.toggle()
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct TimerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TimerAddView(timerData: TimerAddViewModel(refresh: .constant(false)))
    }
}
