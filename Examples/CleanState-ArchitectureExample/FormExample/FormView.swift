//
//  FormView.swift
//  CleanState-ArchitectureExample
//
//  Created by Michał Wójtowicz on 28/12/2020.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FormView.make()
    }
}

struct FormView: View {
    @ObservedObject var state: FormViewState
    let interactor: FormBusinessLogic
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $state.firstName)
                    TextField("Last Name", text: $state.lastName)
                    TextField("Phone Number", text: $state.phoneNumber)
                }
                Button(action: interactor.submit) {
                        HStack {
                            Text("Submit")
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(state.isValid ? .green : .red)
                        }
                    }
                .disabled(!state.isValid)
            }
            .navigationBarTitle("Form Example")
            .sheet(isPresented: $state.showWelcomeView, content: {
                WelcomeView(message: state.welcomeMessage ?? "Welcome")
            })
        }
    }
}

extension FormView {
    static func make() -> FormView {
        let state = FormViewState()
        let interactor = FormInteractor(presenter: state, data: state)
        return FormView(state: state, interactor: interactor)
    }
}
