//
//  ContentView.swift
//  AsyncLetDemo
//
//  Created by Thongchai Subsaidee on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var imageVM = ImageViewModel()
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(imageVM.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Async Let")
        }
        .task {
            do {
                try await imageVM.runImage()
            }catch {
                print("Error: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
