//
//  APIManager.swift
//  ProtocolOrientedUIKit
//
//  Created by Eren Elçi on 4.12.2024.
//

import Foundation

class APIManager: UserService {
    /*
    //Singleton Design Pattern, bir sınıfın yalnızca bir tane örneği olmasını ve bu örneğe global olarak erişilebilmesini sağlayan bir tasarım desenidir
    static let shared = APIManager()
    private init() {} */
    
    
    
    //Istek fonksiyonu
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).first {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
}
