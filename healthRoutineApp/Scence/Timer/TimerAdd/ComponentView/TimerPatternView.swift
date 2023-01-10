//
//  TimerPatternView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternView: View {
    
    var viewType: TimerPatternViewType
    @ObservedObject var timerData: TimerAddViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text(viewType.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(Color(hex: "F9F9F9"))
            /*
             To: 건희님
             왜 이렇게 거지같이 vstack 안의 vstack안의 scrollview안에 hstack으로 짰냐고 물어보시면
             할말이 없으므로 뭐라하지 말아주세요
             저의 바보같은 swiftUI 기술력으로는 이게 한계였답니다...
             봐주세요.... 하하하하하...ㅠㅠ.ㅠ.ㅠ.ㅠ....ㅠㅠㅠㅠㅠㅠㅠ
             저도 이렇게 이차원배열로 바꾸면서 자괴감을 느꼈답니다.ㅋㅋㅋㅋㅋㅋ
             나 진짜 코드 거지같이 짜네.ㅋㅋ.ㅋ..ㅋㅋㅋㅋ 이거 끝나면 스유...쳐다도 안볼겁니다
             */
            TimerPatternInputView(viewType: viewType, timerData: timerData)
            VStack(alignment: .leading, spacing: 6) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewType.getButtonArray().first ?? [], id: \.self) { item in
                            TimerPatternButtonView(buttonData: item, timerAddViewModel: timerData, viewType: viewType)
                        }
                    }
                }
                if viewType.getButtonArray()[safe: 1] != nil {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewType.getButtonArray()[safe: 1] ?? [], id: \.self) { item in
                                TimerPatternButtonView(buttonData: item, timerAddViewModel: timerData, viewType: viewType)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}


struct TimerPatternView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternView(viewType: .exerciseTime, timerData: TimerAddViewModel(refresh: .constant(false)))
    }
}
