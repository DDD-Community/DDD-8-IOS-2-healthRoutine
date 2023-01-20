//
//  MyPageDetailProfileModifyViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import Foundation
import Combine
import UIKit

protocol MyPagePRofileViewInfoType: Equatable {
    
    var photo: UIImage? { get }
    var isDefault: Bool { get }
    var nickname: String { get }
}

struct MyPagePRofileViewInfo: MyPagePRofileViewInfoType {
    
    // 기존 이미지, 닉네임
    private(set) var originPhotoUrl: String? = nil
    private(set) var originNickName: String? = nil
    
    var photo: UIImage? = nil
    var isDefault: Bool = true
    var nickname: String = ""
    
    var isPhotoChanged: Bool {
        
        return self.photo != nil && self.isDefault != (self.originPhotoUrl == nil)
    }
    
    var isNicknameChanged: Bool {
        
        return self.originNickName != self.nickname
    }
    
    var isChanged: Bool {
        
        return self.isPhotoChanged || self.isNicknameChanged
    }
    
    func setPhoto(_ photo: UIImage?) -> Self? {
        
        let newDefault = photo == nil
        
        guard photo != self.photo || newDefault != self.isDefault else { return nil }
        
        var newInfo = self
        
        newInfo.photo = photo
        newInfo.isDefault = newDefault
        
        return newInfo
    }
    
    func setNickname(_ nickname: String) -> Self? {
        
        guard nickname != self.nickname else { return nil }
        
        var newInfo = self
        
        newInfo.nickname = nickname
        return newInfo
    }
}

protocol MyPageDetailViewModelInputs {
    
    func tapPhoto()
    func setPhoto(_ photo: UIImage?)
    func setNickname(_ nickname: String)
    func saveProfile()
}

protocol MyPageDetailViewModelOutputs {
    
    
}

final class MyPageDetailViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var nickname: String = ""
    @Published var imageUrl: String = ""
    
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
    
    func fetchInfo() {
        
        
    }

    // 앨범 권환 확인
    func checkPermission() {
        
    }
    
    func updateInfo() {
        
        guard let token = KeychainService.shared.loadToken() else {
            return
        }
        
        let request = AccountUpdateInfoRequest(token: token, nickname: "", image: Data())
    }

    func logout(_ closure: VoidClosure?) {
        KeychainService.shared.deleteToken()
        closure?()
    }
}
