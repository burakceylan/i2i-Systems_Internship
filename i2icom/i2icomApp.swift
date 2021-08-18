//
//  i2icomApp.swift
//  i2icom
//
//  Created by Burak Ceylan on 13.08.2021.
//

import SwiftUI


var voice = [Package]()
var sms = [Package]()
var internet = [Package]()



@main
struct i2icomApp: App {
    var body: some Scene {
        WindowGroup {
            
            LoginRegisterView()
        }
    }
}
