//
//  i2icomApp.swift
//  i2icom
//
//  Created by Burak Ceylan on 13.08.2021.
//

import SwiftUI


@main
struct i2icomApp: App {
    
    var body: some Scene {
        WindowGroup {
            let customer : Customer = Customer()            
            LoginRegisterView().environmentObject(customer)
            
        }
    }
}
