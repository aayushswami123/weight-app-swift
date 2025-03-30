//
//  MoonView.swift
//  planetweightapp
//
//  Created by Apple on 2/11/25.
//

import SwiftUI

struct MoonView: View {
    let weightOnEarth: Double
    @Binding var navigationPath: [Planet]
    
    var body: some View {
        let weightOnMoon = weightOnEarth / 6
        VStack {
            Image("moon")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text("Earth Weight: \(weightOnEarth, specifier: "%.2f")")
            Text("Moon Weight: \(weightOnMoon, specifier: "%.2f")")
            Text("I feel much lighter!")
            
            Button("Go to Jupiter") {
                navigationPath.append(.jupiter)
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Back to Earth") {
                navigationPath.removeAll()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Moon View")
        .padding()
    }
}
