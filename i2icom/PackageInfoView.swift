//
//  PackageInfoView.swift
//  i2icom
//
//  Created by Burak Ceylan on 15.08.2021.
//

import SwiftUI

struct PackageInfoView: View {
    @State var packageEndDate:String=""
    @State var usedCall:Int=0
    @State var remainCall:Int=0
    @State var usedSms:Int=0
    @State var remainSms:Int=0
    @State var usedNet:Int=0
    @State var remainNet:Int=0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Package Information").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -8.0)
                Rectangle()
                    .frame(width: 230.0, height: 1)
                HStack {
                    Text("Ends: ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(packageEndDate)
                }
                Spacer()
                VStack{
                    Text("CALL").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                    HStack{
                        Text("Used: ").font(.headline)
                        Text(String(usedCall)+"M")
                    }
                    HStack{
                        Text("Remains: ").font(.headline)
                        Text(String(remainCall)+"M")
                    }
                    ZStack(alignment : .leading){
                        Rectangle()
                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                            .frame(width: 220, height: 24)
                        LinearGradient(gradient: Gradient(colors: [Color(red: 14/255, green: 170/255, blue: 0)
                        ]), startPoint: .top, endPoint: .bottom)
                        .frame(width: CGFloat(remainCall), height: 24)
                    }
                    
                }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 125).foregroundColor(.white))
                VStack{
                    Text("SMS").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                    HStack{
                        Text("Used: ").font(.headline)
                        Text(String(usedSms)+"SMS")
                    }
                    HStack{
                        Text("Remains: ").font(.headline)
                        Text(String(remainSms)+"SMS")
                    }
                    ZStack(alignment : .leading){
                        Rectangle()
                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                            .frame(width: 220, height: 24)
                        LinearGradient(gradient: Gradient(colors: [Color(red: 14/255, green: 170/255, blue: 0)
                        ]), startPoint: .top, endPoint: .bottom)
                        .frame(width: CGFloat(remainSms), height: 24)
                    }
                    
                }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 125).foregroundColor(.white))
                
                VStack{
                    Text("Internet").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                    HStack{
                        Text("Used: ").font(.headline)
                        Text(String(usedNet)+"MB")
                    }
                    HStack{
                        Text("Remains: ").font(.headline)
                        Text(String(remainNet)+"MB")
                    }
                    ZStack(alignment : .leading){
                        Rectangle()
                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                            .frame(width: 220, height: 24)
                        LinearGradient(gradient: Gradient(colors: [Color(red: 14/255, green: 170/255, blue: 0)
                        ]), startPoint: .top, endPoint: .bottom)
                        .frame(width: CGFloat(remainNet), height: 24)
                    }
                    
                }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 125).foregroundColor(.white))
                Spacer()
                
            }
            
        }
    }
}

struct PackageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PackageInfoView()
    }
}
