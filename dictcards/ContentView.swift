//
//  ContentView.swift
//  dictcards
//
//  Created by Paweł Goca on 05/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var searchQuery: String = ""
    @State private var description: CFString = "" as CFString
    
    var words = [
        "home",
        "door",
        "yellow"
    ]

    func getDefinition()
    {
        let x = DCSGetTermRangeInString(nil, $searchQuery.wrappedValue as CFString, 0)
        let textDefinition = DCSCopyTextDefinition(nil, searchQuery as CFString, x)
        let text = textDefinition?.takeRetainedValue()
        description = text ?? "" as CFString
    }
    
    var body: some View {
        NavigationView {
            VStack {
                let searchView = VStack {
                    TextField("Search words", text: $searchQuery)
                    Button(action: getDefinition) {
                        Text("Search")
                    }
                    Spacer()
                    Text(description as String)
                }
                
                NavigationLink(destination: searchView) {
                    Text("Search")
                }
                
                List {
                    ForEach(words, id: \.self) { word in
                        NavigationLink(destination: DefinitionView(word)) {
                            Text(word)
                        }
                    }
                }
                .navigationTitle("Words")
                .frame(minWidth: 300)
            }
            .navigationTitle("asdasd")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
