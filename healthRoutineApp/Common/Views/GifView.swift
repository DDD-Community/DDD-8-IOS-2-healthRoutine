//
//  GifView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/17.
//

import SwiftUI

struct GIFView: UIViewRepresentable {
    private let name: String?
    
    public init(name: String) {
        self.name = name
    }
    
    func makeUIView(context: Context) -> GIFImageView {
        return GIFImageView(name: name ?? "")
    }
    
    func updateUIView(_ uiView: GIFImageView, context: Context) {
        uiView.updateGIF(name: name ?? "")
    }
}

class GIFImageView: UIView {
    private let imageView = UIImageView()
    private var name: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        imageView.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        self.addSubview(imageView)
    }
    
    func updateGIF(name: String) {
        imageView.image = UIImage.gifImage(name: name)
    }
}
