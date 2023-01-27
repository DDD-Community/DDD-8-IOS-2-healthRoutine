//
//  GifView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/17.
//

import SwiftUI
import FLAnimatedImage

struct GIFView: UIViewRepresentable {
    private var imageUrl: String

    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }

    private let imageView: FLAnimatedImageView = {
        let imageView = FLAnimatedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
}

extension GIFView {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        view.addSubview(activityIndicator)
        view.addSubview(imageView)

        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        activityIndicator.startAnimating()
        guard let url = Bundle.main.url(forResource: imageUrl, withExtension: "gif") else { return }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = FLAnimatedImage(animatedGIFData: data)

                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    imageView.animatedImage = image
                }
            }
        }
    }
}
