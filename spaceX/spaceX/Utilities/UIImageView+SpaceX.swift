//
//  UIImageView+SpaceX.swift
//  spaceX
//
//  Created by Marco Celestino on 18/02/2021.
//

import UIKit

extension UIImageView{

    func loadImageAsync(for url: URL){

        let activityIndicator = UIActivityIndicatorView(style: .large)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true

        activityIndicator.color = .systemPurple
        activityIndicator.center = center
        activityIndicator.startAnimating()
        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        if let imageCahed = ImageCache.shared.image(for: url){
            self.contentMode = .scaleAspectFill
            self.image = imageCahed
            activityIndicator.stopAnimating()
        }else{
            let downloader = DownloadImageOperation(url)
            downloader.completionBlock = {
                DispatchQueue.main.async {
                    guard downloader.error == nil else{
                        self.contentMode = .scaleAspectFit
                        self.image = UIImage(named: "rocket_placeholder")
                        return
                    }
                    self.contentMode = .scaleAspectFill
                    if let image = downloader.imageDownloaded{
                        self.image = image
                        ImageCache.shared.cache(image: image, for: url)
                    }else{
                        self.image = UIImage(named: "rocket_placeholder")
                    }
                    activityIndicator.stopAnimating()
                }
            }

            let queue = OperationQueue()
            queue.addOperation(downloader)
        }
    }
}
