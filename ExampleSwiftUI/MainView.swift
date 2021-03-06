//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Michael Caesario on 04/05/22.
//

import SwiftUI

struct MainView: View {
    //MARK: - Properties
    
    // binding
    @State private var textfield: String = ""
    
    //MARK: - View
    
    var body: some View {
        NavigationView {
            // Stack the view vertically with VStack and center alignment
            VStack(alignment: .center) {
                
                // Add empty space to push the view in between
                Spacer()
                
                // Text to show the content inside a textfield
                Text(textfield)
                    .font(.title)
                    .fontWeight(.bold)
                
                // Add empty space to push the view in between
                Spacer()
                
                // Textfield
                TextField("Enter your name here", text: $textfield)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.2))
                    )
                    .padding()
                
                // Button to save the text from the textfield
                NavigationLink {
                    GuessTheNumberView()
                } label: {
                    Text("Play Game")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                        .padding()
                }
            }
        }
    }
}

//MARK: - SwiftUI Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
