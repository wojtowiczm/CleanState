//
//  FormInteractor.swift
//  CleanState-ArchitectureExample
//
//  Created by Michał Wójtowicz on 28/12/2020.
//

import Foundation

protocol FormBusinessLogic {
    func submit()
}

struct FormInteractor: FormBusinessLogic {
    weak var presenter: FormPresentationLogic?
    unowned let data: FormData
    
    func submit() {
        presenter?.presentSuccess(message: "Hello, \(data.firstName)")
    }
}
