//
//  APIClient.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import Foundation
import Alamofire

class APIClient{

    public static let shared = APIClient()

    private init(){}

    func makeAPICall<O : Decodable>(_ endpoint: APIEndpoint, responseClass: O.Type, completion: @escaping (Result<O, AFError>) -> Void) -> Void {
        let request = AF.request(endpoint, method: endpoint.method)
        request.responseDecodable { (response) in
            completion(response.result)
        }
    }
}

extension APIClient{

    public func getRockets(_ completion: @escaping (Result<[Rocket], Error>) -> Void){
        self.makeAPICall(.getRockets, responseClass: [Rocket].self, completion: { result in

            switch result{
            case .success(let car):
                completion(.success(car))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
