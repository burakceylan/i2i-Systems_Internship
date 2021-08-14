//
//  ContentView.swift
//  i2icom
//
//  Created by Burak Ceylan on 13.08.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("i2icom").foregroundColor(Color(red: 119, green: 0, blue: 0)).font(.custom("Cookie-Regular", size :150))
                ZStack {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: 150.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .shadow(color: .black, radius: 5, x: 10, y:5 )
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                        })
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .frame(width: /*@START_MENU_TOKEN@*/200.0, height: 60.0/*@END_MENU_TOKEN@*/)).padding(.all)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("REGISTER").font(.largeTitle).bold().foregroundColor(Color.white)
                        }).background(RoundedRectangle(cornerRadius: 10)
                                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)).padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                    }
                   
                }
                .padding(.top)
                
            }
          
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
