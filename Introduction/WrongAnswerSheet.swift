//
//  WrongAnswerSheet.swift
//  Introduction
//
//  Created by Isaac Lee Jing Zhi on 23/6/21.
//

import SwiftUI

struct WrongAnswerSheet: View {
    var body: some View {
        VStack {
            Text("Hi!")
                .fontWeight(.bold)
                .padding()
                .font(Font.custom("SF Pro", size: 40))
                

            
            Text("You still got it wrong, so...")
                .padding()
            
            Link(destination: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!, label: {
                Text("Your Punishment")
            })
            .frame(width: 150, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            .cornerRadius(5)
            
        }
    }
}

struct WrongAnswerSheet_Previews: PreviewProvider {
    static var previews: some View {
        WrongAnswerSheet()
    }
}
