//
//  ContentView.swift
//  JokesApp
//
//  Created by Aydın KAYA on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
       
       var body: some View {
          
           NavigationView {
               
               List(jokesVM.jokes) { element in
                   Text(element.joke)
               }
               .toolbar {
                   Button(action: addJoke) {
                       Text("Get New Joke")
                   }
               }
               .navigationTitle("Jokes App")
               
           }
           
       }
       
       func addJoke() {
           jokesVM.getJokes(count: 1)
       }
}

#Preview {
    ContentView()
}
