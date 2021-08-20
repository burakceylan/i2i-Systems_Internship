//
//  Confirmation.swift
//  i2icom
//
//  Created by Burak Ceylan on 20.08.2021.
//


import SwiftUI

struct ConfirmationView: View {
    @State var eMail:String=""
    var confirmationId:Int
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                HStack {
                    Spacer()
                    Text("Validation Code").font(.largeTitle)
                        .foregroundColor(Color.black).frame(width:300)
                    Spacer()
                }
                TextField(" ", text: $eMail).background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                ).frame(width:300)
                HStack {
                    Spacer()
                    Text("Enter the code we sent to your email").font(.title2)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                }.padding(.all,15)
                NavigationLink(destination: LoginView(), label: {
                    Text("SEND CODE").font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                })
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                .frame(width: 200.0, height: 60.0))
                
            }
        }
    }
}

/*
struct ContentView: PreviewProvider {
    static var previews: some View {
        ConfirmationView(confirmationId: 6)
    }
}*/


