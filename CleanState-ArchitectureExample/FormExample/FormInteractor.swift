//
//  FormInteractor.swift
//  CleanState-ArchitectureExample
//
//  Created by Michał Wójtowicz on 28/12/2020.
//

import Foundation

protocol FormBussinessLogic {
    func submit()
}

struct FormInteractor: FormBussinessLogic {
    weak var presenter: FormPresentationLogic?
    unowned let data: FormData
    
    func submit() {
        //
        print("Call api using \(data.firstName) \(data.lastName)")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.presenter?.presentSuccess()
        }
    }
}
