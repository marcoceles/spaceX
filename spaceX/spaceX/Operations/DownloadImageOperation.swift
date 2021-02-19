//
//  DownloadImageOperation.swift
//  spaceX
//
//  Created by Marco Celestino on 18/02/2021.
//

import UIKit
import Alamofire

class DownloadImageOperation: Operation {

    let url: URL
    private var isCompleted: Bool = false
    private var isPerforming: Bool = false
    var imageDownloaded : UIImage? = nil
    var error: AFError? = nil

    init(_ url: URL) {
        self.url = url
    }

    override var isFinished: Bool{
        get {
            return isCompleted
        }
        set {
            self.willChangeValue(for: \.isFinished)
            isCompleted = newValue
            self.didChangeValue(for: \.isFinished)
        }
    }

    override var isExecuting: Bool{
        get {
            return isPerforming
        }
        set {
            self.willChangeValue(for: \.isExecuting)
            isPerforming = newValue
            self.didChangeValue(for: \.isExecuting)
        }
    }
    override func start() {
        guard !self.isCancelled else {
            return
        }

        self.isExecuting = true

        AF.download(url).responseData { (response) in
            switch response.result{
            case .success(let data):
                self.imageDownloaded = UIImage(data: data)
                self.isFinished = true
            case .failure(let error):
                self.error = error
                self.isExecuting = false
                self.isFinished = true
            }
        }
    }

    override func cancel()
    {
        super.cancel()

        if self.isExecuting
        {
            self.isFinished = true
        }
    }
}

