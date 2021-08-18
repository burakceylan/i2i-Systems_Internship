//
//  PackInfView.swift
//  i2icom
//
//  Created by Burak Ceylan on 17.08.2021.
//

import SwiftUI

import Foundation

// MARK: - PackageInfo
struct PackageInfo: Codable {
    let href, version: String
    let items: [Packages]
}

// MARK: - Item
struct Packages: Codable {
    let data: [dataItem]
}

// MARK: - Datum
struct dataItem: Codable,Hashable {
    let name, value: String
}

struct Package: Codable,Hashable {
    var type,name, used,remaining,end,zone,visible: String
}

func parseJSON(data: Data) -> PackageInfo? {
    
    var returnValue: PackageInfo?
    do {
        returnValue = try JSONDecoder().decode(PackageInfo.self, from: data)
    } catch {
        print("Error took place\(error.localizedDescription).")
    }
    
    return returnValue
}

func getPackages(_voice: inout [Package],_sms: inout [Package],_internet:  inout [Package]) {
    
   
    
    // Create URL
    let url = URL(string: "http://localhost:8080/api/users/5/package")
    guard let requestUrl = url else { fatalError() }

    // Create URL Request
    var request = URLRequest(url: requestUrl)

    // Specify HTTP Method to use
    request.httpMethod = "GET"
    
    // Set HTTP Request Header
    request.setValue("application/vnd.collection+json", forHTTPHeaderField: "Accept")
    request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1MzQ3NzcyOTQ1IiwiZXhwIjoxNjI5MzAzOTU3LCJpYXQiOjE2MjkyNjc5NTd9.s60nLv4V1QnzKvw3dZOU220ptcb-oFI_8xe1wGBrpek", forHTTPHeaderField: "Authorization")

    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data {
            let todoItem = parseJSON(data: data)
                
            // Read todo item title
            guard let todoItemModel = todoItem else { return }
            print("Todo item title = \(todoItemModel.href)")
            
            for pack in todoItemModel.items {
                
                var someProtocol = [String : String]()
                for p in pack.data{
                    someProtocol[p.name]=p.value
                }
                if someProtocol["packageType"]=="v" {
                    voice.append(Package(type:someProtocol["packageType"]!,name:someProtocol["packageName"]!, used:someProtocol["voiceUsed"]!,remaining:someProtocol["voiceRemained"]!,end:someProtocol["endDate"]!,zone:someProtocol["businessZone"]!,visible:someProtocol["visible"]!))
                }else if someProtocol["fileType"]=="s" {
                    
                }else if someProtocol["fileType"]=="d" {
                    
                }
                
            }
        }
        
    }
    task.resume()
    
}
var data = ["adada","adad"]



struct PackInfView: View {
    
    @State var spacing: CGFloat = 10
    @State var headspace: CGFloat = 10
    @State var sidesScaling: CGFloat = 0.8
    @State var isWrap: Bool = false
    @State var autoScroll: Bool = false
    @State var time: TimeInterval = 1
    @State var currentIndex: Int = 0
    @State var currentIndex1: Int = 0
    @State var currentIndex2: Int = 0
    @State var usedCall:Int=10
    @State var remainCall:Int=10
    @State var voice:[Package]
    @State var sms:[Package]
    @State var internet:[Package]
    
    var body: some View {
        
        
        ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white,Color(red: 0/255, green: 183/255, blue: 150/255)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack {
                    Text("Package Information").font(.title).bold()
                    Spacer().frame(height:20)
                    Group{
                        Spacer().frame(height: 10)
                        HStack (alignment :.center){
                            Image("blue")
                                .padding(
                                    .bottom, -10.0)
                            Text("Voice").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -10.0)
                            Spacer()
                        }.frame(width: 250)
                        ACarousel(voice,
                                  id: \.self,
                                  index: $currentIndex,
                                  spacing: spacing,
                                  headspace: headspace,
                                  sidesScaling: sidesScaling,
                                  isWrap: isWrap,
                                  autoScroll: autoScroll ? .active(time) : .inactive) { name in
                            VStack(alignment: .leading){
                                HStack {
                                    Text("CALL").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                                    Spacer().frame(width: 150)
                                }
                                Spacer().frame(height:20)
                                HStack {
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75).opacity(0.2)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75)
                                        
                                    }
                                    Spacer().frame(width: 30)
                                    VStack (alignment: .leading){
                                        
                                        Text("Used Minutes:").font(.headline)
                                        Text(String(usedCall))
                                        Text("Remaining :").font(.headline)
                                        Text(String(remainCall))
                                        
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 150).foregroundColor(.white))
                            
                        }
                        .frame(height: 150)
                        PageControl(page: $currentIndex, data: voice)
                    }
                    Group{
                        Spacer().frame(height: 10)
                        HStack (alignment:.center){
                            Image("green")
                                .padding(
                                    .bottom, -10.0)
                            Text("Sms").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -10.0)
                            Spacer()
                        }.frame(width:250)
                        ACarousel(sms,
                                  id: \.self,
                                  index: $currentIndex1,
                                  spacing: spacing,
                                  headspace: headspace,
                                  sidesScaling: sidesScaling,
                                  isWrap: isWrap,
                                  autoScroll: autoScroll ? .active(time) : .inactive) { name in
                            VStack(alignment: .leading){
                                HStack {
                                    Text("CALL").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                                    Spacer().frame(width: 150)
                                }
                                Spacer().frame(height:20)
                                HStack {
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75).opacity(0.2)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75)
                                        
                                    }
                                    Spacer().frame(width: 30)
                                    VStack (alignment: .leading){
                                        
                                        Text("Used Sms:").font(.headline)
                                        Text(String(usedCall))
                                        Text("Remaining :").font(.headline)
                                        Text(String(remainCall))
                                        
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 150).foregroundColor(.white))
                            
                        }
                        .frame(height: 150)
                        PageControl(page: $currentIndex1, data:sms)
                    }
                    Group{
                        Spacer().frame(height: 10)
                        HStack(alignment:.center) {
                            Image("red")
                                .padding(
                                    .bottom, -10.0)
                            Text("Data").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -10.0)
                            Spacer()
                        }.frame(width:250)
                        ACarousel(internet,
                                  id: \.self,
                                  index: $currentIndex2,
                                  spacing: spacing,
                                  headspace: headspace,
                                  sidesScaling: sidesScaling,
                                  isWrap: isWrap,
                                  autoScroll: autoScroll ? .active(time) : .inactive) { name in
                            VStack(alignment: .leading){
                                HStack {
                                    Text("CALL").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.bottom, -4.0)
                                    Spacer().frame(width: 150)
                                }
                                Spacer().frame(height:20)
                                HStack {
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75).foregroundColor(.green)
                                        
                                    }
                                    Spacer().frame(width: 30)
                                    VStack (alignment: .leading){
                                        
                                        Text("Used Mb:").font(.headline)
                                        Text(String(usedCall))
                                        Text("Remaining :").font(.headline)
                                        Text(String(remainCall))
                                        
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 250, height: 150).foregroundColor(.white))
                            
                        }
                        .frame(height: 150)
                        PageControl(page: $currentIndex2, data : internet)
                    }
                }
                
            }
            
            
        }
    }
}

struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    var data:[Package]
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .gray
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.15)
        view.numberOfPages = data.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        // Updating Page Indicator When Ever Page Changes....
        
        DispatchQueue.main.async {
            
            uiView.currentPage = self.page
        }
    }
}

