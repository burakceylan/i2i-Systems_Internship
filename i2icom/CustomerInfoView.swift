//
//  CustomerInfoView.swift
//  i2icom
//
//  Created by Burak Ceylan on 14.08.2021.
//

import SwiftUI

struct CustomerInfoView: View {
    var nameSurname:String=""
    var eMail:String=""
    var number:String=""
    var packageName:String=""
    var packageStart:String=""
    var packageEnd:String=""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack(){
                Text("Customer Information").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).underline().padding(.bottom)
                VStack {
                    Group {
                        HStack {
                            Text("Name: ")
                            Text(nameSurname)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Surname: ")
                            Text(nameSurname)
                            Spacer()
                        }
                        HStack {
                            Text("Phone: ")
                            Text(number)
                            Spacer()
                        }
                        HStack {
                            Text("Email: ")
                            Text(eMail)
                            Spacer()
                        }
                        HStack {
                            Text("Package Name: ")
                            Text(packageName)
                            Spacer()
                        }
                        HStack {
                            Text("Package Start: ")
                            Text(packageStart)
                            Spacer()
                        }
                        HStack {
                            Text("Package End:")
                            Text(packageEnd)
                            Spacer()
                        }
                        
                    }
                }.frame(width: 300, height: 150,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                Text("Want to see your\n packagee?").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color(red: 119/255, green: 0, blue: 0)).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Show My Package").font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                })
                .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(red: 48/255, green: 48/255, blue: 48/255))
                                .frame(width: 300.0, height: 60.0))
                .padding(.all)
                Spacer()
                
            }
            
        }
    }
}

struct CustomerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerInfoView()
    }
}
