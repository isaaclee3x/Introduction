//
//  ContentView.swift
//  Introduction
//
//  Created by Isaac Lee Jing Zhi on 23/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Angle = .zero
    @State private var accesstoTab = false
    @State private var isPresented = false
    @State private var foregroundColor: Color = .black
    @State private var backgroundColorFirstButton = Color.red
    @State private var backgroundColorSecondButton = Color.yellow
    @State private var foregroundColorLabel = Color.white
    
    var body: some View {
        TabView {
            ZStack {
                VStack {
                    Image("flowers")
                        .resizable()
                        .frame(width: 400, height: 300, alignment: .top)
                        .shadow(radius: 5)
                        .rotationEffect(rotation)
                        .onAppear {
                            withAnimation(.linear(duration: 0.1).repeatForever(autoreverses: false)) {
                                rotation = Angle(degrees: 360)
                                
                            }
                        }
                    Spacer()
                        .frame(height: 50)
                    Text("Guess what this picture is?")
                    
                    HStack {
                        Button("Flower") {
                            accesstoTab = true
                            withAnimation() {
                                foregroundColor = .white
                                rotation = Angle(degrees: 0)
                                backgroundColorFirstButton = Color.white
                                backgroundColorSecondButton = Color.white
                                foregroundColorLabel = Color.black
                            }
                        }
                        .frame(width: 110, height: 40)
                        .background(backgroundColorFirstButton)
                        .cornerRadius(10)
                        .foregroundColor(foregroundColor)
                        .padding()
                        
                        Button("Tree"){
                            accesstoTab = false
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
            
            VStack {
                
            }
            .tabItem {
                Image(systemName: "doc.plaintext")
                Text(accesstoTab ? "My Info" : "NO ACCESSSSS!!!!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


