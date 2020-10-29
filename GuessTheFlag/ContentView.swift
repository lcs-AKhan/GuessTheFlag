//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Abdul Ahad Khan on 2020-10-28.
//

import SwiftUI

struct ContentView: View {
    
    // Variables
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    
    var body: some View {
        
        ZStack {
            // Background color
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    
                    // Title
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    
                    // Flag you need to tap
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    

                }
                
                // Flag buttons
                ForEach( 0 ..< 3 ) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)

                    }
                }
                
                // Score display
                Text("Score: \(playerScore)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top)
                
                Spacer()
            }
        }
        
        // Alert that shows up after tapping a flag
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(playerScore)"), dismissButton:
                    .default(Text("Continue")) {
                        self.askQuestion()
                    })
        }
    }
    
    // Scoring system
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            playerScore += 1
            scoreTitle = "Correct"
        } else {
            playerScore = 0
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    // Shuffle countries
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
