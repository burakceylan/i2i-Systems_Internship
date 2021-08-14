//
//  LoginView.swift
//  i2icom
//
//  Created by Burak Ceylan on 14.08.2021.
//

import SwiftUI

struct LoginView: View {
    @State var number:String=""
    @State var password:String=""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Group {
                VStack(spacing:10){
                    HStack {
                        Text("Phone Number").font(.largeTitle).bold().foregroundColor(Color.black)
                        Spacer()
                    }
                    
                    TextField(" (5**) *** ** **", text: $number).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Text("Password").font(.largeTitle).bold().foregroundColor(Color.black)
                        Spacer()
                    }
                    SecureField("", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                    })
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 200.0, height: 60.0)).padding(.all)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Forgot Password?").font(.custom("", size: 25)).bold().foregroundColor(Color.white)
                    })
                    
                }
                .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
