//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Abdul Ahad Khan on 2020-10-28.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                    Text(countries[correctAnswer])
                }
                .foregroundColor(.white)
                ForEach( 0 ..< 3 ) { number in
                    Button(action: {
                        // Button was tapped
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)

                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
