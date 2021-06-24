//
//  ContentView.swift
//  Introduction
//
//  Created by Isaac Lee Jing Zhi on 23/6/21.
//

import SwiftUI

struct ContentView: View {
    
    //State vars for display
    @State private var rotation: Angle = .zero
    @State private var rotationSecondPicture: Angle = .zero
    
    //State vars for access/presented content
    @State private var wrongAttempts = 0
    @State private var accesstoTab = false
    @State private var isPresented = false
    @State private var isSheetPresented = false
    
    //State vars for changing color values
    @State private var foregroundColor: Color = .black
    @State private var foregroundColorTopLabel: Color = .black
    @State private var backgroundColorFirstButton = Color.red
    @State private var backgroundColorSecondButton = Color.yellow
    @State private var foregroundColorLabel = Color.white
    
    var body: some View {
        TabView {
            
        //First tab
            
            ZStack {
                VStack {
                    Image("flowers")
                        .resizable()
                        .frame(width: 400, height: 300, alignment: .top)
                        .shadow(radius: 5)
                        .rotationEffect(rotation)
                        .onAppear {
                            withAnimation(.linear(duration: 0.1).repeatForever()) {
                                rotation = Angle(degrees: 360)
                            }
                        }
                    Spacer()
                        .frame(height: 90)
                    Text("Guess what this picture is?")
                        .foregroundColor(foregroundColorTopLabel)
                    
                    HStack {
                        Button("Flower") {
                            accesstoTab = true
                            withAnimation() {
                                foregroundColor = .white
                                rotation = Angle(degrees: 0)
                                backgroundColorFirstButton = Color.white
                                backgroundColorSecondButton = Color.white
                                foregroundColorLabel = Color.black
                                foregroundColorTopLabel = Color.white
                            }
                        }
                        .frame(width: 110, height: 40)
                        .background(backgroundColorFirstButton)
                        .cornerRadius(10)
                        .foregroundColor(foregroundColor)
                        .padding()
                        
                        Button("Tree"){
                            accesstoTab = false
                            if wrongAttempts < 3 {
                                wrongAttempts += 1
                                print(wrongAttempts)
                            }
                            else if wrongAttempts == 3 {
                                isSheetPresented = true
                                wrongAttempts = 0
                            }
                            
                        }
                        .frame(width: 110, height: 40)
                        .background(backgroundColorSecondButton)
                        .cornerRadius(10)
                        .foregroundColor(foregroundColor)
                        .padding()
                        
                    }
                    Text("Click on My Info for more information")
                        .foregroundColor(foregroundColorLabel)
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .tabItem {
                Image(systemName: "person.circle")
                Text("Recognition")
            }
            
            
            //Second Tab
            
            
            ZStack {
                Color.yellow
                VStack(alignment: .center) {
                    Text("Who created this??")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(Font.custom("Helvetica Neue", size: 30))
                    
                    Image("sushi")
                        .resizable()
                        .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .mask(Circle())
                        .rotationEffect(rotationSecondPicture)
                    
                    Text("ME! Isaac")
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .padding()
                    
                    Text("""
                         - Sorta kind? Maybe
                         - Going insane
                         - Always there to help
                         """)
                        .font(Font.custom("American Typewriter", size: 15))
                        .frame(width: 200, height:150, alignment: .center)
                        .background(Color.green)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    HStack {
                        Text("Proof?")
                            .font(Font.custom("SF Pro", size: 10))
                        
                        Button("Click Here Then") {
                            rotationSecondPicture += Angle(degrees: 10)
                        }
                        .opacity(0.5)
                        .font(Font.custom("SF Pro", size: 10))
                        .frame(width: 90, height: 50)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(10)
                        
                    }
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .tabItem {
                Image(systemName: "doc.plaintext")
                Text(accesstoTab ? "My Info" : "NO ACCESSSSS!!!!")
                
            }
        }
        .sheet(isPresented: $isSheetPresented){
            WrongAnswerSheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


