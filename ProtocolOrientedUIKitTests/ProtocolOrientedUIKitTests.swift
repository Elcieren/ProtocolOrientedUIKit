//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Eren Elçi on 4.12.2024.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    private var userViewModel: UserViewModel!
    private var userService: MockUserService!
    private  var output: MockUserViewModelOutput!
    
    

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }
    
    

    func testUpdateView_whenAPISucces_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Eren", username: "elci", email: "elci@eren", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.fetchUser()
        
        XCTAssertEqual(output.updateViewArray.first?.username, "elci")
        
    }
    
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUser()
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
        
    }


    

}

class MockUserService: UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, any Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, any Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
}


class MockUserViewModelOutput: UserViewModelOutput {
    var updateViewArray :  [(name: String, email: String, username: String)] = []
    func updateView(name: String, email: String, username: String) {
        updateViewArray.append((name,email,username))
    }

}
