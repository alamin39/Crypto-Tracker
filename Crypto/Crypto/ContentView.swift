//
//  ContentView.swift
//  Crypto
//
//  Created by Al-Amin on 2023/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 44) {
            
            Text("Hello, world!")
                .foregroundColor(Color.theme.secondaryText)
            Text("Hello, world!")
                .foregroundColor(Color.theme.accent)
            Text("Hello, world!")
                .foregroundColor(Color.theme.red)
            Text("Hello, world!")
                .foregroundColor(Color.theme.green)
        }
        .ignoresSafeArea()
        .font(.largeTitle)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
