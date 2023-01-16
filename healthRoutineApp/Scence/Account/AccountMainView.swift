//
//  AccountMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI
import Combine

struct AccountMainView: View {
        
    private let boardInfo: [OnBoarding] = [.workout, .drink, .routine]
    
    var body: some View {
        CustomNavigationView {

            BaseView {

                VStack(spacing: 16) {
                    TabView {
                        
                        ForEach(boardInfo, id: \.self) {
                            OnBoardingView(onBoarding: $0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.background_black)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .cornerRadius(16)
                    .padding(.top, 19)
                    .onAppear { self.setupAppearance() }

                    // MARK: - 로그인 뷰 이동 처리
                    CustomNavigationLink(destination: SignInView())  {
                        Text("로그인")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .font(Font.pretendard(.bold, size: 18))
                            .foregroundColor(.black)
                            .background(Color.main_green)
                            .cornerRadius(10)
                    }
                    // MARK: - 회원가입 뷰 이동 처리
                    CustomNavigationLink(destination: SignUpMainView().customNavigationTitle("회원가입")) {
                        Text("회원가입")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .font(Font.pretendard(.bold, size: 18))
                            .foregroundColor(Color(hex: "E2E1E5"))
                            .background(Color(hex:"252525"))
                            .cornerRadius(10)
                    }
                }
                .customNavigationBarBackButtonHidden(true)
            }
        }
    }
    
    func setupAppearance() {
        
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.main_green)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.white_text)
    }
}

struct AccountMainView_Previews: PreviewProvider {
    static var previews: some View {
        AccountMainView()
    }
}

enum OnBoarding {
    
    case workout
    case drink
    case routine
    
    var image: String {
        
        switch self {
        case .workout: return "onBoarding1"
        case .drink: return "onBoarding2"
        case .routine: return "onBoarding3"
        }
    }
    
    var title: String {
        
        switch self {
        case .workout: return "Work out."
        case .drink: return "Drink."
        case .routine: return "Have Routine."
        }
    }
    
    var desc: String {
        
        switch self {
        case .workout: return "나의 운동 패턴을 기록해요"
        case .drink: return "매일의 수분 섭취를 추적해요"
        case .routine: return "나만의 운동 루틴을 저장해요"
        }
    }
    
    var guide: String {
        switch self {
        case .workout: return "운동 패턴을 저장해서 쉽게 기록할 수 있어요."
        case .drink: return "수분 섭취 기록도 버튼 하나로!"
        case .routine: return "운동 루틴 타이머로 나만의 시간 루틴을 짜요!"
        }
    }
}

struct OnBoardingView: View {
    
    var onBoarding: OnBoarding
    
    var body: some View {
        
        VStack {
            Text(onBoarding.title)
                .foregroundColor(.main_green)
                .font(Font.pretendard(.bold, size: 36))
                .padding(.bottom, 5)
            
            Text(onBoarding.desc)
                .foregroundColor(.white_text)
                .font(Font.pretendard(.bold, size: 18))
                .padding(.bottom, 19)
            
            Image(onBoarding.image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 274)
                .padding(.bottom, 6)
            
            Text(onBoarding.guide)
                .foregroundColor(.white_text)
                .font(Font.pretendard(.bold, size: 14))
                .padding(.vertical, 5)
        }
    }
}
