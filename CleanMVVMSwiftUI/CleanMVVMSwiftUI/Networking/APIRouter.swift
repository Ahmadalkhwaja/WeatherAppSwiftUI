//
//  APIRouter.swift
//  CleanMVVMSwiftUI
//
//  Created by User on 21/03/2023.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var actionParameters: [String: Any] { get }
    var baseURL: String { get }
    var authHeader: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRouter {
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(
            url: baseURL.appending(path),
            method: method,
            headers: authHeader)
        let encodedRequest = try encoding.encode(
            originalRequest,
            with: actionParameters)
        return encodedRequest
    }
}
