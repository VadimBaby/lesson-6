//
//  ContentView.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("✋🏼 🌍")
        }
        .padding()
        .onAppear(perform: viewModel.input.onAppear.send)
    }
}

#Preview {
    ContentView()
}
