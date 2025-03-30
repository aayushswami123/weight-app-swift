import SwiftUI

struct ContentView: View {
    @State private var weightOnEarth: String = ""
    @State private var navigationPath: [Planet] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                
                Text("Welcome To planet Weight")
                Image("earth")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Enter your weight on Earth:")
                    .font(.headline)
                TextField("Weight", text: $weightOnEarth)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
                
                NavigationLink(value: Planet.moon) {
                    Text("Go to Moon")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationDestination(for: Planet.self) { planet in
                switch planet {
                case .moon:
                    if let weight = Double(weightOnEarth) {
                        MoonView(weightOnEarth: weight, navigationPath: $navigationPath)
                    }
                case .jupiter:
                    if let weight = Double(weightOnEarth) {
                        JupiterView(weightOnEarth: weight, navigationPath: $navigationPath)
                    }
                }
            }
            .padding()
        }
    }
}



enum Planet: Hashable {
    case moon, jupiter
}
