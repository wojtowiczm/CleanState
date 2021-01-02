//
//  FormInteractorTests.swift
//  CleanState-ArchitectureExampleTests
//
//  Created by Michał Wójtowicz on 02/01/2021.
//

import XCTest
@testable import CleanState_ArchitectureExample

final class FormInteractorTest: XCTestCase {
    var sut: FormInteractor!
    var presenter: PresenterSpy!
    var data: DataStub!
    
    override func setUp() {
        super.setUp()
        presenter = .init()
        data = .init()
        sut = .init(presenter: presenter, data: data)
    }

    func testSubmit() {
        sut.submit()
        XCTAssertEqual(presenter.presentSuccessMessage, "Hello, \(data.firstName)")
    }
}

extension FormInteractorTest {
    final class PresenterSpy: FormPresentationLogic {
        var presentSuccessMessage: String?
        
        func presentSuccess(message: String) {
            presentSuccessMessage = message
        }
    }
    
    final class DataStub: FormData {
        var firstName: String = "George"
        var lastName: String = "Lucas"
        var phoneNumber: String = "66"
    }
}
