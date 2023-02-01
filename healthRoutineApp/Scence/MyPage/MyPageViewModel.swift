//
//  MyPageDetailProfileModifyViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/22.
//

import Foundation
import Combine
import SwiftUI
import UIKit

final class MyPageViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    // Profile
    @Published var nickname: String = UserDefaults.standard.string(forKey: NICKNAME_KEY)!
    @Published var recentImage: UIImage?
    
    @Published var showImagePicker: Bool = false // 이미지 선택화면 여부
    @Published var showActionSheet: Bool = false // 시트 화면 여부
    
    var updateProfileFinished = PassthroughSubject<Bool, Never>()
    var updateFinished = PassthroughSubject<Bool, Never>()
    
    // Badge
    @Published var badges: [Badge] = []

    func actionSheet() -> ActionSheet {
        
        let albumButton = ActionSheet.Button.default(Text("앨범에서 선택하기")) { self.showImagePicker = true }
        let destructiveButton = ActionSheet.Button.destructive(Text("프로필 사진삭제")) { self.recentImage = nil }
        let cancelButton = ActionSheet.Button.cancel(Text("닫기"))
        let actionSheet = ActionSheet(title: Text("이미지를 선택해주세요"),
                                      buttons: [albumButton, destructiveButton, cancelButton])
        return actionSheet
    }

    func logout(_ closure: VoidClosure?) {
        KeychainService.shared.deleteToken()
        closure?()
    }
}

extension MyPageViewModel {
    
    func fetchProfile() {
        
        APIService.fetchProfileInfo()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .http: do {}
                    default: do {}
                    }
                case .finished:
                    break
                }
            } receiveValue: { (value: AccountMyInfoProfileResponse) in
                self.updateInfo(value)
            }
            .store(in: &cancellables)
    }
    
    func updateProfileImage() {
        
        APIService.updateProfileImage(recentImage)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .http: do {}
                    default: do {}
                    }
                case .finished:
                    break
                }
            } receiveValue: { (value: AccountMyInfoImageUploadResponse) in
                self.updateProfileFinished.send(true)
            }
            .store(in: &cancellables)
    }
    
    func updateUserInfo() {
        
        let param = AccountProfileUpdateRequest(nickname: self.nickname)
        
        APIService.updateProfile(param)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .http: do {}
                    default: do {}
                    }
                case .finished:
                    break
                }
            } receiveValue: { _ in
                UserDefaults.standard.set(self.nickname, forKey: NICKNAME_KEY)
                self.updateFinished.send(true)
            }
            .store(in: &cancellables)
    }
}

extension MyPageViewModel {
    
    private func updateInfo(_ response: AccountMyInfoProfileResponse) {
        
        guard let profileImage = response.result.profileImage else {
            return
        }
        
        self.recentImage = profileImage.load()
        self.nickname = response.result.nickname
    }
}
