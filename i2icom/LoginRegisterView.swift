//
//  ContentView.swift
//  i2icom
//
//  Created by Burak Ceylan on 13.08.2021.
//

import SwiftUI

struct LoginRegisterView: View {
   @EnvironmentObject var customer :Customer
    @State var  succesfull = false
    @State var  succesfull2 = false
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                Group {
                    VStack (spacing: 5){
                        Image("i2iCell").resizable().scaledToFit()
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: 180.0)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                .shadow(color: .black, radius: 5, x: 10, y:5 )
                            VStack(spacing : 15){
                                NavigationLink(destination: LoginView().environmentObject(customer), isActive:$succesfull, label: {
                                    Button(action: {
                                       succesfull=true
                                    }, label: {
                                        Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                                    }).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                                    .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 60.0)).padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                                })
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                                .frame(width: 200.0, height: 60.0))
                                
                                NavigationLink(destination: MobileRegisterView().environmentObject(customer), isActive:$succesfull2, label: {
                                    Button(action: {
                                       succesfull2=true
                                    }, label: {
                                        Text("REGISTER").font(.largeTitle).bold().foregroundColor(Color.white)
                                    }).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                                    .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 60.0))
                                })
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                                .frame(width: 200.0, height: 60.0)).padding(.all)
                                
                                
                            }
                            
                            
                        }
                        
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                
            }
            
        }
        
    }
}


