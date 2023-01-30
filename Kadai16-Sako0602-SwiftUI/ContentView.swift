//
//  ContentView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresentedAddView = false
    @State private var isPresentedEditVIew = false
    @State public var fruitIndex = 0
    @State private var fruitArray = [
        FruitsData(name: "りんご", isChecked: false),
        FruitsData(name: "みかん", isChecked: true),
        FruitsData(name: "バナナ", isChecked: false),
        FruitsData(name: "パイナップル", isChecked: true),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitArray.indices, id: \.self) { index in
                    HStack{
                        Button {
                            fruitArray[index].isChecked.toggle()
                        } label: {
                            HStack{
                                Image(systemName: fruitArray[index].isChecked
                                      ? "checkmark"
                                      : ""
                                )
                                .foregroundColor(Color.red)
                                .frame(width: 30, height: 30)
                                Text(fruitArray[index].name)
                            }
                        }
                        .foregroundColor(Color.black)
                        Spacer()
                        Button {
                            fruitIndex = index
                            isPresentedEditVIew = true
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentedAddView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                }
            }
            .sheet(isPresented: $isPresentedAddView) {
                FruitsAddView(
                    save: { name in
                        fruitArray.append(FruitsData(name: name, isChecked: false))
                        isPresentedAddView = false
                    } ,cancel: {
                        isPresentedAddView = false
                    }
                )
            }
            .sheet(isPresented: $isPresentedEditVIew)  {
                let save: (String) -> Void = { name in
                    fruitArray[fruitIndex].name = name
                    fruitArray[fruitIndex].isChecked = false
                    isPresentedEditVIew = false
                }
                EditView(
                    fruitData: $fruitArray[fruitIndex],
                    save: save
                ){
                    isPresentedEditVIew = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
