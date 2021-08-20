//
//  MobileRegisterView.swift
//  i2icom
//
//  Created by Burak Ceylan on 14.08.2021.
//

import SwiftUI

struct MobileRegisterView: View {
    @State var name:String=""
    @State var lastName:String=""
    @State var eMail:String=""
    @State var number:String=""
    @State var passwordFirst:String=""
    @State var passwordSecond:String=""
    @State var  succesfull = false
    @State var confirmationID = 0
    
    @EnvironmentObject var customer :Customer
    var body: some View {
        GeometryReader{ geo in
            ZStack
            {
                LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack (spacing:15){
                    Group{
                        HStack {
                            Spacer()
                            Text("Welcome").font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.black)
                                
                            Spacer()
                        }
                        HStack {
                            Text("Name").font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        
                        TextField("   Write your full name", text: $name)
                            .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            )
                        HStack {
                            Text("Last Name").font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        
                        TextField("   Write your full name", text: $lastName)
                            .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            )
                    }
                   
                    HStack {
                        Text("Email").font(.largeTitle)
                            .bold()
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    TextField("   Write your email", text: $eMail)
                        .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
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
                    SecureField("   Chose strong one", text: $passwordFirst)
                        .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                    HStack {
                        Text("Password Again").font(.largeTitle).bold().foregroundColor(Color.black)
                        Spacer()
                    }
                    SecureField("   Write password again", text: $passwordSecond)
                        .background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                    NavigationLink(destination: ConfirmationView(confirmationId: self.confirmationID).environmentObject(customer), isActive:$succesfull, label: {
                        Button(action: {
                            registeration(name: name, lastName: lastName , email: eMail, msisdn: number, pass: passwordFirst) { RegisterResponse in
                                if RegisterResponse.registerRequestSuccess{
                                    confirmationID = RegisterResponse.registerConfirmationID
                                    succesfull = true
                                }
                            }
                        }, label: {
                            Text("REGISTER").font(.largeTitle).bold().foregroundColor(Color.white)
                        }).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 60.0)).padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                    })
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                    .frame(width: 200.0, height: 60.0))
                    .padding(.all)
                    
                }.edgesIgnoringSafeArea(.all).frame(width: 300, height: geo.size.height)
            }
        }
    }
}


