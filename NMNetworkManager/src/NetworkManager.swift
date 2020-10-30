//
//  NetworkManager.swift
//  NMNetworkManager
//
//  Created by Nilesh Malviya on 10/25/20.
//

public enum ConnectionType {
    case get
    case post
    case put
    case delete
}

public enum Error {
    case badJson
}

import Foundation

public class NetworkManager {
    
    /// Method to make request
    /// - Parameters url : url
    /// - Parameters method : connection type POST or Get
    /// - Parameters completion : completion block
    static public func performNetworkAction(url: URL, methodType : ConnectionType, completion: @escaping(_ data: Data?, _ error: Error?) -> Void) {
        var urlR = URLRequest(url: url)
//        urlR.timeoutInterval 
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let data = data {
                completion(data, nil)
            } else {
                completion(nil, Error.badJson)
            }
        }.resume()
    }
}
