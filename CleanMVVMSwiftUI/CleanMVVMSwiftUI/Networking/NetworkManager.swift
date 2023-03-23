//
//  NetworkManager.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func request(router: APIRouter, completionBlock: @escaping (AFDataResponse<Data>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    var session: Session?
    
    required init(session: Session = .default) {
        self.session = session
    }
    
    func request(router: APIRouter, completionBlock: @escaping (AFDataResponse<Data>) -> Void) {
        session?.request(router).responseData(completionHandler: {data in
            completionBlock(data)
        })
    }
}
