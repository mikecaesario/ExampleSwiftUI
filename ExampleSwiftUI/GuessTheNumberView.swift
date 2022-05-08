//
//  SecondView.swift
//  ExampleSwiftUI
//
//  Created by Michael Caesario on 05/05/22.
//

import SwiftUI

struct GuessTheNumberView: View {
    @State private var hintText: String = "Guess!"
    @State private var correctNumber: Int = 0
    @State private var nextLevel: Bool = true
    @State private var isSelected: Int = 0
    
    // this property will set how many grid/ columns from the left to the right
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        // vertically stack the view
        VStack {
            
            Spacer()
            
            Text(hintText)
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                .background(
                    Capsule()
                        .fill(.yellow)
                        .frame(height: 50)
                )
                .padding()
            
            Spacer()
            
            // I loop over the number with ForEach and set the layout with LazyVGrid
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(1..<41) { index in
                    ZStack {
                        if isSelected == index {
                            Capsule()
                                .foregroundColor(.yellow.opacity(0.5))
                        }
                        
                        Text("\(index)")
                            .font(.body)
                            .foregroundColor(Color.black)
                            .padding(7)
                    }
                    .onTapGesture {
                        withAnimation(.linear) {
                        calculate(number: index)
                        }
                        
                        isSelected = index
                    }
                }
            }
            .padding()
            
            Spacer()
            
            Button {
                withAnimation(.linear) {
                    randomNumber()
                    nextLevel = true
                    hintText = "Game Reset. Try Again"
                    // get a bit hacky in here!
                    isSelected = 41
                }
            } label: {
                Text("Reset Game")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(!nextLevel ? .black : .white)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(!nextLevel ? .yellow : .secondary)
                    )
                    .padding(.horizontal)
            }
            // disabled the reset button until the user get the correct answers
            .disabled(nextLevel)
            
            Spacer()
        }
        .navigationTitle("Guess The Correct Number")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            randomNumber()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessTheNumberView()
        }
    }
}

//MARK: - Functions

extension GuessTheNumberView {
    
    private func randomNumber() {
        // think i made some mistake here before lol
        correctNumber = Int.random(in: 1...40)
    }
    
    private func calculate(number: Int) {
        if number > correctNumber {
            hintText = "Lower"
        } else if number < correctNumber {
            hintText = "Higher"
        } else {
            hintText = "Correct!"
            nextLevel = false
        }
    }
}
