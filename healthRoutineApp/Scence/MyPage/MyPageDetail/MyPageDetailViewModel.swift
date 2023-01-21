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

protocol MyPagePRofileViewInfoType: Equatable {
    
    var photo: UIImage? { get }
    var isDefault: Bool { get }
    var nickname: String { get }
    var hasError: Bool { get }
    var errorText: String? { get }
    
    init(accountInfo: AccountInfo?)
}

struct MyPagePRofileViewInfo: MyPagePRofileViewInfoType {
    
    // 기존 이미지, 닉네임
    private(set) var originPhotoUrl: String? = nil
    private(set) var originNickName: String? = nil
    
    var photo: UIImage? = nil
    var isDefault: Bool = true
    var nickname: String = ""
    var hasError: Bool = false
    var errorText: String? = nil
    
    var isPhotoChanged: Bool {
        
        return self.photo != nil && self.isDefault != (self.originPhotoUrl == nil)
    }
    
    var isNicknameChanged: Bool {
        
        return self.originNickName != self.nickname
    }
    
    var isChanged: Bool {
        
        return self.isPhotoChanged || self.isNicknameChanged
    }
    
    init(accountInfo: AccountInfo?) {
        
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
    
    func setDuplicatedError() -> Self {
        
        var newInfo = self
        newInfo.hasError = true
        newInfo.errorText = "중복된 닉네임 입니다. 다른 닉네임으로 설정해주세요."
        
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
    var accountInfo: AccountInfo = AccountInfo()
    
    @Published var nickname: String = ""
    @Published var recentImage: UIImage?
    
    @Published var showImagePicker: Bool = false // 이미지 선택화면 여부
    @Published var showActionSheet: Bool = false // 시트 화면 여부
    
    @Published var confirmBtnActive: Bool = false
    
    init() {
        
        self.bindView()
    }

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

extension MyPageDetailViewModel {
    
    private func bindView() {
        
        
    }
}
