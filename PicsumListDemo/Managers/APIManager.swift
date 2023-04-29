//
//  APIManager.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 25/4/2566 BE.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class APIManager {
    static let shared = APIManager()
    
    func request(endpoint: String, method: HTTPMethod , headers: [String: String]?, body: Data?) async throws -> Data {
        guard let url = URL(string: endpoint) else {
            throw NSError(domain: "Invalid endpoint URL", code: 0, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        let session = URLSession.shared
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
        }
        
        if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
            return data
        } else {
            throw NSError(domain: "API request failed with status code \(httpResponse.statusCode) : \(httpResponse.description)", code: httpResponse.statusCode, userInfo: nil)
        }
    }
}

//Old Solution
/*
class APIManager {
    static let shared = APIManager()

    func request(endpoint: String, method: HTTPMethod , headers: [String: String]?, body: Data?, completion: @escaping (Data?, Error?) -> Void) {

        guard let url = URL(string: endpoint) else {
            completion(nil, NSError(domain: "Invalid endpoint URL", code: 0, userInfo: nil))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        if let body = body {
            request.httpBody = body
        }

        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NSError(domain: "Invalid response", code: 0, userInfo: nil))
                return
            }

            if error != nil {
                completion(nil, error)
            } else if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                completion(data, nil)
            } else {
                completion(nil, NSError(domain: "API request failed with status code \(httpResponse.statusCode)", code: httpResponse.statusCode, userInfo: nil))
            }
        }

        task.resume()
    }
}
*/
