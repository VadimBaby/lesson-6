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
            Text("set token as nil")
                .onTapGesture {
                    UserStorage.shared.setValue(nil, forKey: .token)
                    print(UserStorage.shared.string(forKey: .token))
                }
        }
        .padding()
        .onAppear(perform: viewModel.input.onAppear.send)
    }
}

#Preview {
    ContentView()
}
