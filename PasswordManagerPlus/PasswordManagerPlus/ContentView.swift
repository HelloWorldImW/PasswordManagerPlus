//
//  ContentView.swift
//  PasswordManagerPlus
//
//  Created by Joe on 2020/9/29.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...100, id: \.self) { _ in
                    VStack {
                        HStack {
                            Image(systemName: "pencil")
                            Text("icon")
                        }
                        Text("Copy")
                    }.frame(width: 200, height: 200)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
