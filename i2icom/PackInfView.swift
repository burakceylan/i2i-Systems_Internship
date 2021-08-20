//
//  PackInfView.swift
//  i2icom
//
//  Created by Burak Ceylan on 17.08.2021.
//

import SwiftUI

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
    @State var voice:[Pack]
    @State var sms:[Pack]
    @State var internet:[Pack]
    init() {
        voice = [Pack]()
        sms = [Pack]()
        internet = [Pack]()
    }
    
    @EnvironmentObject var customer :Customer
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
                        HStack {
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
                                    Spacer().frame(width:20)
                                    Text(name.packageName)
                                    VStack{
                                        Text("Package Ends")
                                        Text(name.endDate)
                                    }
                                }
                                Spacer().frame(height:20)
                                HStack {
                                    
                                    Spacer().frame(width:20)
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75).foregroundColor(.green)
                                        
                                    }
                                    Spacer().frame(width: 50)
                                    VStack (alignment: .leading){
                                        
                                        Text("Used Minutes:").font(.headline)
                                        Text(String(name.usedAmount))
                                        Text("Remaining :").font(.headline)
                                        Text(String(name.remainedAmount))
                                        
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 320, height: 150).foregroundColor(.white))
                            
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
                                    
                                    Spacer().frame(width:20)
                                    Text(name.packageName)
                                    VStack{
                                        Text("Package Ends")
                                        Text(name.endDate)
                                    }
                                }
                                Spacer().frame(height:20)
                                HStack {
                                    
                                    Spacer().frame(width:20)
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75).foregroundColor(.green)
                                        
                                    }
                                    Spacer().frame(width: 50)
                                    VStack (alignment: .leading){
                                        
                                        Text("Used Sms:").font(.headline)
                                        Text(String(name.usedAmount))
                                        Text("Remaining :").font(.headline)
                                        Text(String(name.remainedAmount))
                                        
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 320, height: 150).foregroundColor(.white))
                            
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
                                    Spacer().frame(width:20)
                                    Text(name.packageName)
                                    VStack{
                                        Text("Package Ends")
                                        Text(name.endDate)
                                    }
                                }
                                Spacer().frame(height:10)
                                HStack {
                                    Spacer().frame(width:20)
                                    ZStack(alignment : .leading){
                                        Circle().stroke(lineWidth: 5)
                                            .foregroundColor(Color(red: 148/255, green: 0, blue: 0))
                                            .frame(width: 75, height: 75)
                                        Circle()
                                            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.25)
                                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: 75, height: 75).foregroundColor(.green)
                                        
                                    }
                                    Spacer().frame(width: 50)
                                    VStack (alignment: .leading){
                                        Text("Used Mb:").font(.headline)
                                        Text(String(name.usedAmount))
                                        Text("Remaining :").font(.headline)
                                        Text(String(name.remainedAmount))
                                    }
                                    
                                }
                                
                            }.padding(.vertical).frame(alignment:.top ).background(RoundedRectangle(cornerRadius: 10).frame(width: 320, height: 150).foregroundColor(.white))
                            
                        }
                        .frame(height: 150)
                        PageControl(page: $currentIndex2, data : internet)
                    }
                }
                
            }
            
        }.onAppear{
            for pack in customer.packages!.packages{
                if pack.packageType == "v"{
                    self.voice.append(pack)
                }else if pack.packageType == "s"{
                    self.sms.append(pack)
                }else if pack.packageType == "d"{
                    self.internet.append(pack)
                }
                
                
            }
        }
    }
}

struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    var data:[Pack]
    
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


