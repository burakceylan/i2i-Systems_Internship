//
//  PasswordRefreshView.swift
//  i2icom
//
//  Created by Burak Ceylan on 15.08.2021.
//

import SwiftUI

struct SendCodeView: View {
    @State var eMail:String=""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Spacer()
                    Text("Password Refresh").font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding(.bottom)
                    
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Email").font(.largeTitle)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                TextField("   Write your email", text: $eMail).background(RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50, alignment: .center).foregroundColor(Color.white)).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1).frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                )
                NavigationLink(destination: ValidateView(), label: {
                    Text("SEND CODE").font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                })
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                .frame(width: 200.0, height: 60.0))
                .padding(.top, 40.0).padding(.bottom,15)
                HStack {
                    Spacer()
                    Text("Check your email").font(.title2)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                }
            }
            
        }
    }
}

struct PasswordRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        SendCodeView()
    }
}
