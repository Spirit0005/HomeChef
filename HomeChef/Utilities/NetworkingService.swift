//
//  NetworkingService.swift
//  HomeChef
//
//  Created by Hamza on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//
//
//import Foundation
//
//class NetworkingService {
//
//    let loginUrl = "http://qa.homechef.pk/api/v1/login"
//
//    func request(endpoint:String ,
//                 parameteres:[String:Any] ,
//                 completion: @escaping (Result<String, Error>) -> Void){
//
//        guard let url = URL(string:loginUrl + endpoint) else {
//            completion(.failure(NetworkingError.badUrl))
//            return
//        }
//
//        var request = URLRequest(url:url)
//
//        var components = URLComponents()
//
//        var queryItems = [URLQueryItem]()
//
//        for (key, value) in parameteres {
//
//            let queryItem = URLQueryItem(name: key, value: String(describing:value))
//            queryItems.append(queryItem)
//        }
//
//        components.queryItems = queryItems
//
//        let queryItemData = components.query?.data(using: .utf8)
//
//
//
//    }
//
//}
//enum NetworkingError:Error {
//    case badUrl
//}
