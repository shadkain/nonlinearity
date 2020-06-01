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
    func getStory(id: Int, completion: ((Story?) -> Void)?)
    func getRubrics(completion:(([Rubric]?)-> Void)?)
}

final class NetworkManager: NetworkManagerDescription {
    
    func getRubrics(completion: (([Rubric]?) -> Void)?) {
        let urlString = "\(baseUrl)/topStories"
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
                let headings: Headings = try self.decoder.decode(Headings.self, from: data)
                completion?(headings.headings)
            } catch let error {
                print(error.localizedDescription)
                completion?(nil)
            }
        }.resume()
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
    
    func getStory(id: Int, completion: ((Story?) -> Void)?) {
        let urlString = "\(baseUrl)/getStory?id=\(id)"
      
        guard let fullUrl = URL(string: urlString) else {
            completion?(nil)
            return
        }
            
        let task = URLSession.shared.dataTask(with: fullUrl) { (data, response, error) in
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
                return
            }
        }
        
        task.resume()
        
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
    
    private let baseUrl = "http://127.0.0.1:8080"
    private let staticUrl = "https://toringolimagestorage.s3.eu-north-1.amazonaws.com"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
}
