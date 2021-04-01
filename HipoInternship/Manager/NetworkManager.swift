//
//  NetworkManager.swift
//  HipoInternship
//
//  Created by Ahmet Acar on 1.04.2021.
//

import UIKit

class NetworkManager {
    
    private let baseURL = "https://api.github.com/users/"

    func getAvatarURL(githubUserName: String, completionHandler: @escaping (Result<String, HipoError>) -> Void) {
        let endPoint = "\(baseURL)\(githubUserName)"
        guard let url = URL(string: endPoint) else {
            completionHandler(.failure(HipoError.urlError))
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    let gitInfoModel = try decoder.decode(GithubInfoModel.self, from: data!)
                    completionHandler(.success(gitInfoModel.avatarUrl))

                } catch {
                    completionHandler(.failure(.decodeError))
                }

            }
        }
        dataTask.resume()
    }
}
