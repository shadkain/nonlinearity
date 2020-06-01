//
//  NetworkManager.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

protocol NetworkManagerDescription {
    func signup(user: User, completion: ((Bool) -> Void)?)
    func login(user: User, completion: ((Bool) -> Void)?)
    func getStory(id: Int, completion: ((StoryModel?) -> Void)?)
    func getRubrics(completion:(([Rubric]?)-> Void)?)
    func getStoryDataJSON(storyPath: String, completion:((Data?)-> Void)?)
    func getAvatarStoryData(avatarStoryPath: String, completion: ((Data?) -> Void)?)
    func getAvatarUser(avatarPath: String, completion: ((Data?) -> Void)?)
    func getProfile(completion: ((User?) -> Void)?)
    func logout(completion: ((Bool?) -> Void)?)
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
    
    func signup(user: User, completion: ((Bool) -> Void)?){
        
        let urlString = "\(baseUrl)/signup/"
        guard let fullUrl = URL(string: urlString) else {
            completion?(false)
            return
        }
        
        let request = NSMutableURLRequest(url: fullUrl)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let jsonData = try encoder.encode(user)
            request.httpBody = jsonData
        } catch {
            completion?(false)
            return
        }
            
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            completion?(true)
        }.resume()
            
            return
        }
    
    func getStory(id: Int, completion: ((StoryModel?) -> Void)?) {
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
                let story = try self.decoder.decode(StoryModel.self, from: data)
                completion?(story)
            } catch let error {
                print(error.localizedDescription)
                completion?(nil)
                return
            }
        }
        
        task.resume()
        
    }
    
    func login(user: User, completion: ((Bool) -> Void)?) {
        var state = false
        let urlString = "\(baseUrl)/signin/"
        guard let fullUrl = URL(string: urlString) else {
            completion?(state)
            return
        }
        
        let request = NSMutableURLRequest(url: fullUrl)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
             let jsonData = try encoder.encode(user)
             request.httpBody = jsonData
         } catch {
             completion?(state)
             return
         }
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion?(false)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode != 200 {
                    completion?(false)
                    return
                }
            }
            state = true
            completion?(state)
        }.resume()
    }
    
    func getStoryDataJSON(storyPath: String, completion: ((Data?) -> Void)?) {
        guard let fullUrl = URL(string: storyPath) else {
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
            
            completion?(data)
        }
        
        task.resume()
    }
    
    func getAvatarStoryData(avatarStoryPath: String, completion: ((Data?) -> Void)?) {
        //let urlString = "\(avatarStoryPath)"
      
        guard let fullUrl = URL(string: avatarStoryPath) else {
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
            
            completion?(data)
        }
        
        task.resume()
    }
    
    func getAvatarUser(avatarPath: String, completion: ((Data?) -> Void)?) {
        let urlString = "\(staticUrl)/avatars/\(avatarPath)"
      
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
            
            completion?(data)
        }
        
        task.resume()
    }
    
    func getProfile(completion: ((User?) -> Void)?) {
        let urlString = "\(baseUrl)/profile/"
        
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
                  let user = try self.decoder.decode(User.self, from: data)
                  completion?(user)
              } catch let error {
                  print(error.localizedDescription)
                  completion?(nil)
                  return
              }
          }
          
          task.resume()
          
    }
    
    
    func logout(completion: ((Bool?) -> Void)?) {
        var state: Bool = false
        let urlString = "\(baseUrl)/logout/"
        guard let fullUrl = URL(string: urlString) else {
            completion?(state)
            return
        }
        
        let request = NSMutableURLRequest(url: fullUrl)
        request.httpMethod = "GET"
            
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion?(state)
                return
            }
            state = true
            completion?(state)
        }.resume()
            
        return
    }
//
//    func rateStory(ratingModel: RatingModel, completion: ((Bool?) -> Void)?) {
//        var state: Bool = false
//        let urlString = "\(baseUrl)/rateStory/"
//        guard let fullUrl = URL(string: urlString) else {
//            completion?(state)
//            return
//        }
//
//        let request = NSMutableURLRequest(url: fullUrl)
//
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        do {
//            let jsonData = try encoder.encode(user)
//            request.httpBody = jsonData
//        } catch {
//            completion?(state)
//            return
//        }
//
//        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            state = true
//            completion?(state)
//        }.resume()
//
//            return
//    }

    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseUrl = "http://127.0.0.1:8080"
    private let staticUrl = "https://toringolimagestorage.s3.eu-north-1.amazonaws.com"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
}
