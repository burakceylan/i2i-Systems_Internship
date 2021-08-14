//
//  MobileRegisterView.swift
//  i2icom
//
//  Created by Burak Ceylan on 14.08.2021.
//

import SwiftUI

struct MobileRegisterView: View {
    @State var nameSurname:String=""
    @State var eMail:String=""
    @State var number:String=""
    @State var passwordFirst:String=""
    @State var passwordSecond:String=""
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
                            Text("Name Surname").font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        
                        TextField("   Write your full name", text: $nameSurname)
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
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("REGISTER").font(.largeTitle)
                            .bold()
                            .foregroundColor(Color.white)
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

struct MobileRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        MobileRegisterView()
    }
}
