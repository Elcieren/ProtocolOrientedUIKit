//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Eren Elçi on 5.12.2024.
//

import Foundation


protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, email: String , username: String)
}
