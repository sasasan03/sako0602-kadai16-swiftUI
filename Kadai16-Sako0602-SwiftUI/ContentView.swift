//
//  ContentView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    @State private var fruitArray = [
        FruitsData(name: "りんご", isChecked: false),
        FruitsData(name: "みかん", isChecked: true),
        FruitsData(name: "バナナ", isChecked: false),
        FruitsData(name: "パイナップル", isChecked: true),
    ]
    
    var body: some View {
        NavigationStack {
            List (fruitArray) { item in
                FruitRowView(fruit: item)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                }
            }
            .sheet(isPresented: $isPresented) {
                FruitsAddView(
                    save: { name in
                        fruitArray.append(FruitsData(name: name, isChecked: false))
                        isPresented = false
                    } ,cancel: {
                        isPresented = false
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
