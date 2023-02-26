//
//  ToastView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/27.
//

import SwiftUI
import Combine

struct ToastView: View {
    
    var title: String
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(Font.pretendard(.semiBold, size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 46)
                .padding()
                .background(Color.gray_888)
                .cornerRadius(10)
        }
        .padding(.bottom, 50)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(title: "수정이 완료되었습니다.")
    }
}

extension View {
    
    func toast(isShowing: Binding<Bool>, text: String) -> some View {
        self.modifier(Toast(isShowing: isShowing, text: text))
    }
}

struct Toast: ViewModifier {
    
    @Binding var isShowing: Bool
    let text: String
    
    private var showToastPublisher: AnyPublisher<Bool, Never> {
        
        NotificationCenter.default
            .publisher(for: UIApplication.didEnterBackgroundNotification)
            .map { _ in false }
            .eraseToAnyPublisher()
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isShowing {
                        
                        ToastView(title: text)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation {
                                        isShowing = false
                                    }
                                }
                            }
                    }
                }
            )
            .onReceive(showToastPublisher) { showToast in
                withAnimation {
                    isShowing = showToast
                }
            }
    }
}

