//
//  ContentView.swift
//  i2icom
//
//  Created by Burak Ceylan on 13.08.2021.
//

import SwiftUI

struct LoginRegisterView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            Group {
                VStack (spacing: 10){
                    Text("i2icom").foregroundColor(Color(red: 119/255, green: 0, blue: 0)).font(.custom("Cookie-Regular", size :150))
                    ZStack {
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: 150.0)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black, radius: 5, x: 10, y:5 )
                        VStack(spacing : 15){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                            })
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                            .frame(width: 200.0, height: 60.0)).padding(.all)
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("REGISTER").font(.largeTitle).bold().foregroundColor(Color.white)
                            }).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 60.0)).padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                        }
                       
                    }
                    
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
          
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
