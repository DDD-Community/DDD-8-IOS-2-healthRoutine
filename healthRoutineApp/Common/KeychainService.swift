//
//  KeychainService.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/19.
//

import Foundation
import Security

// Constant Identifiers
let accessGroup = "SecuritySerivice"
let KEYCHAIN_TOKEN = "LOGIN_TOKEN"

let kSecClassValue = String(kSecClass)
let kSecAttrAccountValue = String(kSecAttrAccount)
let kSecValueDataValue = String(kSecValueData)
let kSecAttrServiceValue = String(kSecAttrService)
let kSecMatchLimitValue = String(kSecMatchLimit) // 중복이면 하나만
let kSecReturnDataValue = String(kSecReturnData)
let kSecAttrAccessibleValue = String(kSecAttrAccessible)

public class KeychainService {
    public static let shared = KeychainService()
    private init() {}

    public func saveToken(token: String) {
        let key = KEYCHAIN_TOKEN
        KeychainService.shared.save(key, token)
    }

    public func loadToken() -> String? {
        let token = KeychainService.shared.load(KEYCHAIN_TOKEN)
        return token
    }

    /// 토큰유효한지 체크
    public func isTokenValidate() -> Bool {
        if let _ = KeychainService.shared.load(KEYCHAIN_TOKEN) {
            return true
        }
        else {
            return false
        }
    }

    public func deleteToken() {
        KeychainService.shared.delete(KEYCHAIN_TOKEN)
    }

    public func save(_ key: String, _ value: String) {
        var keychainQuery = self.getKeychainQuery(key)

        self.delete(key)

        if let value = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false) {
            keychainQuery[kSecValueDataValue] = value
        }

        let status: OSStatus = SecItemAdd(keychainQuery as CFDictionary, nil)

        if status != errSecSuccess {
            print("저장실패: \(status)")
        }
        else {
            print("저장성공")
        }
    }

    public func load(_ key: String) -> String? {
        var keychainQuery = self.getKeychainQuery(key)

        keychainQuery[kSecReturnDataValue] = kCFBooleanTrue
        keychainQuery[kSecMatchLimitValue] = kSecMatchLimitOne
        var result: AnyObject?
        let status: OSStatus = SecItemCopyMatching(keychainQuery as CFDictionary, &result)

        guard status == errSecSuccess else { print("처리실패. Status code \(status)"); return nil }
        guard let resultData = result as? Data else { print("로드 실패. \(status)"); return nil }
        guard let value = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(resultData) as? String else {
            return nil
        }
        return value
    }

    public func delete(_ key: String) {
        let keychainQuery = self.getKeychainQuery(key)

        let status = SecItemDelete(keychainQuery as CFDictionary)
        if status != errSecSuccess {
            print("삭제실패: \(status)")
        }
        else {
            print("삭제성공")
        }
    }

    public func getKeychainQuery(_ key: String) -> [String: Any] {
        let keychainQuery: [String: Any] = [
            kSecClassValue: kSecClassGenericPassword,
            kSecAttrServiceValue: key,
            kSecAttrAccountValue: key,
            kSecAttrAccessibleValue: kSecAttrAccessibleAfterFirstUnlock
        ]
        return keychainQuery
    }
}
