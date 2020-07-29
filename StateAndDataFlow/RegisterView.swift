//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...",
                          text: $name,
                          onCommit: registerUser)
                    .multilineTextAlignment(.center)
                    .font(.title)
                Text("\(name.count)")
                    .foregroundColor(name.count > 2 ? .blue : .red)
                   
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle").imageScale(.large)
                    Text("OK")
                        .font(.largeTitle)
                }
            }
            .disabled(name.count > 2 ? false : true)
        
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if name.count > 2 {
            user.name = name
            user.isRegistered = true
            DataManager.shared.saveUser(with: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
