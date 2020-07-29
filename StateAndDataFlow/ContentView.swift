//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            
            VStack {
                Spacer()
                ButtonView(timer: timer)
                Spacer()
                LogOutButton()
            }
        }
    }
}

struct LogOutButton: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Button(action: logoutUser) {
                Text("Log out")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .buttonStyle(MyButtonStyle(backColor: .blue))
        }
    }
}

extension LogOutButton {
    func logoutUser() {
        user.isRegistered = false
        user.name = ""
        DataManager.shared.deleteUser()
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        VStack {
            Button(action: { self.timer.startTemer() }) {
                Text("\(timer.buttonTitle)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .buttonStyle(MyButtonStyle(backColor: .red))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserManager())
    }
}
