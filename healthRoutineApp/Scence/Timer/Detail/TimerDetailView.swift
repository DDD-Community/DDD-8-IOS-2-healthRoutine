//
//  TimerDetailView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                TopMenuVeiw(isMainView: false)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        ForEach(TimerPatternViewType.allCases, id: \.self) { type in
                            TimerPatternView(viewType: type)
                        }
                    }
                }
                .padding([.leading, .top, .trailing], 20)
                Button {
                    addTimer()
                } label: {
                    Text("타이머 추가하기")
                        .frame(maxWidth: .infinity, minHeight: 59)
                        .background(.gray)
                        .cornerRadius(30)
                }
                .padding(20)
            }
        }
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
    
    func addTimer() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct TimerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDetailView()
    }
}
