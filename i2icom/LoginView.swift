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
    @State var  succesfull = false    
    @EnvironmentObject var customer :Customer
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            Group {
                VStack(spacing:15){
                    HStack {
                        Text("Phone Number").font(.largeTitle).bold().foregroundColor(Color.black)
                        Spacer()
                    }
                    
                    TextField("   (5**) *** ** **", text: $number)
                        .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                    
                    HStack {
                        Text("Password").font(.largeTitle).bold().foregroundColor(Color.black)
                        Spacer()
                    }
                    SecureField("", text: $password)
                        .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                    NavigationLink(destination: CustomerInfoView().environmentObject(customer),isActive:$succesfull, label: {
                        Button(action: {
                            getCustomerInformations(msisdn: number, pass: password){(output) in
                                if output.loginSuccess{
                                    customer.setUserID(userID: output.userID)
                                    customer.setJwt(jwt: output.jwt)
                                    customer.setName(name: output.name)
                                    customer.setlastName(lastName: output.lastName)
                                    customer.setMsisdn(msisdn: output.msisdn)
                                    customer.setEmail(email: output.email)
                                    customer.setLogin(succes: output.loginSuccess)
                                    self.succesfull=true                                    
                                }
                            }
                                                        
                        }, label: {
                            Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                        }).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 60.0)).padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                    })
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                    .frame(width: 200.0, height: 60.0)).padding(.top,25).padding(.bottom,15)
                    NavigationLink(destination: LoginView(), label: {
                        Text("Forgot Password?").font(.custom("", size: 25)).bold().foregroundColor(Color.white)
                    })
                    
                }
                .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
        }
    }
}



