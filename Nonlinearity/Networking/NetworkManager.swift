//
//  NetworkManager.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

protocol NetworkManagerDescription {
    func signup(user: User) -> Bool
    func login(user: User) -> Bool
    func getStory(completion: ((Story?) -> Void)?)
    func getRubrics(completion:(([Rubric]?)-> Void)?)
}

final class NetworkManager: NetworkManagerDescription {
    
    func getRubrics(completion: (([Rubric]?) -> Void)?) {
        let urlString = "\(baseUrl)/rubrics"
        guard let fullUrl = URL(string: urlString) else {
            completion?(nil)
            return
        }
            
        URLSession.shared.dataTask(with: fullUrl) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion?(nil)
                return
            }
        
            guard let data = data else {
                completion?(nil)
                return
            }
            
            do {
                let rubrics = try self.decoder.decode([Rubric].self, from: data)
                completion?(rubrics)
            } catch let error {
                print(error.localizedDescription)
                completion?(nil)
            }
        }
    }
    
    func signup(user: User) -> Bool {
        var state: Bool = false
        let urlString = "\(baseUrl)/signup"
        guard let fullUrl = URL(string: urlString) else {
            return state
        }
        
        let request = NSMutableURLRequest(url: fullUrl)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            return state
        }
            
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            state = true
        }.resume()
            
            return state
        }
    
    func getStory(completion: ((Story?) -> Void)?) {
        let urlString = "\(baseUrl)/story"
        guard let fullUrl = URL(string: urlString) else {
            completion?(nil)
            return
        }
            
        URLSession.shared.dataTask(with: fullUrl) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion?(nil)
                return
            }
        
            guard let data = data else {
                completion?(nil)
                return
            }
            
            do {
                let story = try self.decoder.decode(Story.self, from: data)
                completion?(story)
            } catch let error {
                print(error.localizedDescription)
                completion?(nil)
            }
        }
    }
    
    func login(user: User) -> Bool {
        var state = false
        let urlString = "\(baseUrl)/login"
        guard let fullUrl = URL(string: urlString) else {
            return state
        }
        
        let request = NSMutableURLRequest(url: fullUrl)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
             let jsonData = try encoder.encode(user)
             request.httpBody = jsonData
         } catch {
             return state
         }
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            state = true
        }.resume()
        
        return state
    }
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseUrl = "someBaseUrl"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
}
