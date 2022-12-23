//
//  MyPageDetailProfileModifyViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import Foundation
import Combine

final class MyPageDetailViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var nickname: String = ""
    @Published var imageUrl: String = ""
    
    @Published var isActiveNicknameField: Bool = false
    
    var nickNameInfo = PassthroughSubject<(Bool, String), Never>()
    
    init() {
        self.bind()
    }
    
    private func bind() {
        
        $nickname
            .map { $0.isValidNickname }
            .sink(receiveValue: {
                self.nickNameInfo.send(($0, "오류발생"))
            })
            .store(in: &cancellables)
    }
    
    func confirmNickname() {
        
        
    }

    // 앨범 권환 확인
    func checkPermission() {
        
        
    }
}

final class MyPageDetailModifyViewModel: ObservableObject {
    
    @Published var nickname: String = ""
}
