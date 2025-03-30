//
//  JupiterView.swift
//  planetweightapp
//
//  Created by Apple on 2/11/25.
//

import SwiftUI

struct JupiterView: View {
    let weightOnEarth: Double
    @Binding var navigationPath: [Planet]
    
    var body: some View {
        let weightOnMoon = weightOnEarth / 6
        let weightOnJupiter = weightOnEarth * 2.4
        VStack {
            Image("jupiter")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text("Earth Weight: \(weightOnEarth, specifier: "%.2f")")
            Text("Moon Weight: \(weightOnMoon, specifier: "%.2f")")
            Text("Jupiter Weight: \(weightOnJupiter, specifier: "%.2f")")
            Text("I feel heavier!")
            Button("Back to Moon") {
                navigationPath.removeLast()
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
        .navigationTitle("Jupiter View")
        .padding()
    }
}
