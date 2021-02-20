//
//  RemoteImage.swift
//  spaceX
//
//  Created by Marco Celestino on 19/02/2021.
//

import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var image: UIImage?
        var state = LoadState.loading

        init(url: URL?) {
            guard let url = url else {
                return
            }

            if let imageCahed = ImageCache.shared.image(for: url){
                self.image = imageCahed
                self.state = .success
                self.objectWillChange.send()
            }else{
                let downloader = DownloadImageOperation(url)
                downloader.completionBlock = {
                    DispatchQueue.main.async {

                        guard downloader.error == nil else{
                            self.state = .failure
                            return
                        }
                        if let image = downloader.imageDownloaded{
                            self.image = image
                            self.state = .success
                            ImageCache.shared.cache(image: image, for: url)
                        }else{
                            self.state = .failure
                        }
                        self.objectWillChange.send()
                    }
                }

                let queue = OperationQueue()
                queue.addOperation(downloader)
            }
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: URL?, loading: Image = Image("rocket_placeholder"), failure: Image = Image("rocket_placeholder")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = loader.image {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
