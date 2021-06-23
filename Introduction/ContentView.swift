//
//  ContentView.swift
//  Introduction
//
//  Created by Isaac Lee Jing Zhi on 23/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Angle = .zero
    @State private var correctAnswer = false
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("flowers")
                    .resizable()
                    .frame(width: 400, height: 300, alignment: .top)
                    .shadow(radius: 5)
                    .rotationEffect(rotation)
                    .onAppear {
                        withAnimation(.linear(duration: 0.3).repeatForever(autoreverses: false)) {
                            rotation = Angle(degrees: 360)
                            
                        }
                    }
                Spacer()
                    .frame(height: 50)
                Text("Guess what this picture is?")
                
                HStack {
                    Button("Flower") {
                        isPresented = true
                        correctAnswer = true
                    }
                    .padding()
                    Button("Weird Thing"){
                        correctAnswer = false
                        isPresented  = true
                    }
                    .padding()
                    }
                
                
                }
            }
        alert(isPresented: $isPresented) {
            
            Alert(title: Text(correctAnswer ? "Correct!!" : "HOW???"), message: Text(correctAnswer ? "Wow, you did it!! It wasn't so difficult after all!" : "😾 IT WAS SO EASY!! stupid baka"), dismissButton: Alert.Button.default(Text(correctAnswer ? "Tks!" : "You don't have to remind me for god sake!"))
                  
            )}
        }
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

