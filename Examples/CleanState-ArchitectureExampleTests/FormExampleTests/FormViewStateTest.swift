//
//  FormViewStateTest.swift
//  CleanState-ArchitectureExampleTests
//
//  Created by Michał Wójtowicz on 03/01/2021.
//

import XCTest
@testable import CleanState_ArchitectureExample

final class FormViewStateTest: XCTestCase {
    var sut: FormViewState!
    
    override func setUp() {
        super.setUp()
        sut = .init()
    }

    func testPresentSuccess() {
        let message = "Some random message"
        sut.presentSuccess(message: message)
        XCTAssertEqual(sut.welcomeMessage, message)
    }
}
