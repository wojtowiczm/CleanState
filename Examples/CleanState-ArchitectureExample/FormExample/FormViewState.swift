//
//  FormViewState.swift
//  CleanState-ArchitectureExample
//
//  Created by Michał Wójtowicz on 28/12/2020.
//

import Foundation
import Combine

protocol FormPresentationLogic: class {
    func presentSuccess(message: String)
}

// Data exposed to logic
protocol FormData: class {
    var firstName: String { get }
    var lastName: String { get }
    var phoneNumber: String { get }
}

final class FormViewState: ObservableObject, FormData {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""
    
    @Published var isValid: Bool = false
    @Published var showWelcomeView = false
    @Published var welcomeMessage: String? {
        didSet { showWelcomeView = true }
    }
    
    private var cancelableBag: Set<AnyCancellable> = []
    
    init() {
        bindValidation()
    }
    
    private func bindValidation() {
        Publishers.CombineLatest($firstName, $lastName)
            .map { firstName, lastName in
                return !firstName.isEmpty && !lastName.isEmpty
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancelableBag)
    }
}

extension FormViewState: FormPresentationLogic {
    func presentSuccess(message: String) {
        welcomeMessage = message
    }
}
