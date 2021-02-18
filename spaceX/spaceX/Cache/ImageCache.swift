//
//  ImageCache.swift
//  spaceX
//
//  Created by Marco Celestino on 18/02/2021.
//

import Foundation
import UIKit

class ImageCache{

    static let shared = ImageCache()

    private let cached = NSCache<NSURL, UIImage>()

    func image(for url: URL) -> UIImage?{
        if let cacheImage = cached.object(forKey: url as NSURL) {
            return cacheImage
        }
        return nil
    }

    func cache(image: UIImage, for url: URL){
        self.cached.setObject(image, forKey: url as NSURL)
    }
}
