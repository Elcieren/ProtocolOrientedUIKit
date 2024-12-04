//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Eren Elçi on 4.12.2024.
//

import Foundation



protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
