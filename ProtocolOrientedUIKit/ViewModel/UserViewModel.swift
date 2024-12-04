//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Eren Elçi on 4.12.2024.
//

import Foundation


class UserViewModel  {
    private let userService: UserService
    weak var output : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUser() {
        userService.fetchUser { [weak self ] user in
            switch user {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, username: user.username)
            case .failure(let error):
                self?.output?.updateView(name: "No User", email: "", username: "")
            }
        }
    }
    
    
    
}
