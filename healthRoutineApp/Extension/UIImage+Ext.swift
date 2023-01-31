//
//  UIImage+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/31.
//

import Foundation
import UIKit

extension UIImage {
    class func gifImage(name: String) -> UIImage? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "gif"),
              let data = try? Data(contentsOf: url)
        else {
            return nil
        }
        return gifImage(data: data)
    }
    
    class func gifImage(data: Data) -> UIImage? {
        // image source생성.
        guard let source = CGImageSourceCreateWithData(data as CFData, nil)
        else {
            return nil
        }
        
        let count = CGImageSourceGetCount(source) // gif 이미지 개수
        let delays = (0..<count).map {
            Int(delayForImage(at: $0, source: source) * 1000)
        }
        let duration = delays.reduce(0, +)
        let gcd = delays.reduce(0, gcd)
        
        var frames = [UIImage]()
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frame = UIImage(cgImage: cgImage)
                let frameCount = delays[i] / gcd
                
                for _ in 0..<frameCount {
                    frames.append(frame)
                }
            } else {
                return nil
            }
        }
        return UIImage.animatedImage(with: frames,
                                     duration: Double(duration) / 1000.0)
    }
}

private func gcd(_ a: Int, _ b: Int) -> Int {
    let absB = abs(b)
    let r = abs(a) % absB
    if r != 0 {
        return gcd(absB, r)
    } else {
        return absB
    }
}

private func delayForImage(at index: Int, source: CGImageSource) -> Double {
    let defaultDelay = 1.0
    
    // image index 속성값
    let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
    let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
    defer {
        gifPropertiesPointer.deallocate()
    }
    let unsafePointer = Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()
    if CFDictionaryGetValueIfPresent(cfProperties, unsafePointer, gifPropertiesPointer) == false {
        return defaultDelay
    }
    let gifProperties = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
    var delayWrapper = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                          Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
                                     to: AnyObject.self)
    if delayWrapper.doubleValue == 0 {
        delayWrapper = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                          Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()),
                                     to: AnyObject.self)
    }
    
    if let delay = delayWrapper as? Double,
       delay > 0 {
        return delay
    } else {
        return defaultDelay
    }
}
