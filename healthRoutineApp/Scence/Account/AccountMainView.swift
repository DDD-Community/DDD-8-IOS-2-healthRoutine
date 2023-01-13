//
//  AccountMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI
import Combine

struct AccountMainView: View {
    
    @State var hasToken: Bool = false
    
    private let boardInfo: [OnBoarding] = [.fist, .second, .third]
    
    var body: some View {
        
        if hasToken {
            
            ContentView()
            
        } else {
            
            CustomNavigationView {
                
                BaseView {
                    
                    VStack(spacing: 16) {
                        
                        TabView {
                        
                            ForEach(boardInfo, id: \.self) {
                                OnBoardingView(onBoarding: $0)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.box_color)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .cornerRadius(16)
                        .onAppear { self.setupAppearance() }

                        // MARK: - 회원가입 뷰 이동 처리
                        CustomNavigationLink(destination: SignUpMainView().customNavigationTitle("회원가입")
                        ) {
                            Text("회원가입")
                                .frame(maxWidth: .infinity, minHeight: 60)
                                .font(Font.pretendard(.bold, size: 18))
                                .foregroundColor(Color(hex: "E2E1E5"))
                                .background(Color(hex:"252525"))
                                .cornerRadius(10)
                        }
                        
                        // MARK: - 로그인 뷰 이동 처리
                        CustomNavigationLink(destination: SignInView(hasToken: self.$hasToken))  {
                            Text("로그인")
                                .frame(maxWidth: .infinity, minHeight: 60)
                                .font(Font.pretendard(.bold, size: 18))
                                .foregroundColor(.black)
                                .background(Color.main_green)
                                .cornerRadius(10)
                        }
                    }
                    .customNavigationBarBackButtonHidden(true)
                }
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
    
    case fist
    case second
    case third
    
    var image: String {
        
        switch self {
        case .fist: return "onBoarding1"
        case .second: return "onBoarding2"
        case .third: return "onBoarding3"
        }
    }
    
    var title: String {
        
        switch self {
        case .fist: return "나의 운동 패턴을 기록해요"
        case .second: return "매일 수분 섭취를 추적해요"
        case .third: return "나만의 운동 루틴을 저장해요"
        }
    }
    
    var desc: String {
        
        switch self {
        case .fist: return "매일 운동을 기록하기"
        case .second: return "매일의 수분을 섭취하기"
        case .third: return "매일 운동루틴을 저장하기"
        }
    }
}

struct OnBoardingView: View {
    
    var onBoarding: OnBoarding
    
    var body: some View {
        
        VStack {
            
            Text(onBoarding.title)
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
            
            Text(onBoarding.desc)
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 13))
                .padding(.top, 15)
            
            Image(onBoarding.image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 300)
        }
    }
}
