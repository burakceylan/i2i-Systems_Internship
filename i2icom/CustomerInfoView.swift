//
//  CustomerInfoView.swift
//  i2icom
//
//  Created by Burak Ceylan on 14.08.2021.
//

import SwiftUI

struct CustomerInfoView: View {
    @State var nameSurname:String=""
    @State var eMail:String=""
    @State var number:String=""
    @State var packageName:String=""
    @State var packageStart:String=""
    @State var packageEnd:String=""
    
    @State var  succesfull = false
    @EnvironmentObject var customer :Customer
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
                            Text(customer.name ?? "-" )
                            Spacer()
                        }
                        
                        HStack {
                            Text("Surname: ")
                            Text(customer.lastName ??  "-" )
                            Spacer()
                        }
                        HStack {
                            Text("Phone: ")
                            Text(String((customer.msisdn ?? "-")) )
                            Spacer()
                        }
                        HStack {
                            Text("Email: ")
                            Text(customer.email ?? "-")
                            Spacer()
                        }
                        
                    }
                }.frame(width: 300, height: 150,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                Text("Want to see your\n packagee?").fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color(red: 119/255, green: 0, blue: 0)).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: PackInfView().environmentObject(customer),isActive:$succesfull , label: {
                    Button(action: {
                        getPackages(jwt:customer.jwt!,userID: customer.userID!){(output) in
                            if output.packages.count>0{
                                customer.setPackageList(packages: output)
                                self.succesfull=true
                            }
                        }
                                                    
                    }, label: {
                        Text("LOGIN").font(.largeTitle).bold().foregroundColor(Color.white)
                    })
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
