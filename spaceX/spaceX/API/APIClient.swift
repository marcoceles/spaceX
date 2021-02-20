//
//  APIClient.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import Foundation
import Alamofire
import Combine

class APIClient{

    public static let shared = APIClient()

    private init(){}

    func makeAPICall<O : Decodable>(_ endpoint: APIEndpoint, responseClass: O.Type, completion: @escaping (Result<O, AFError>) -> Void) -> Void {
        let request = AF.request(endpoint, method: endpoint.method)
        request.responseDecodable { (response) in
            completion(response.result)
        }
    }

    private func makeAPICall<O>(_ endpoint: APIEndpoint) -> AnyPublisher<O, AFError> where O: Decodable {
        let publisher = AF.request(endpoint)
            .validate()
            .publishDecodable(type: O.self)
        return publisher.value()
    }
}

extension APIClient{

    func getRockets() -> AnyPublisher<[Rocket], AFError> {
        return makeAPICall(.getRockets)
    }
}
