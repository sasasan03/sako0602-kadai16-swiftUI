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
    @State var editFruit: FruitsData? = nil
    @State  var selectedIndex: Int = 0
    @State private var fruitArray = [
        FruitsData(name: "もも", isChecked: false),
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
                            selectedIndex = index
                            editFruit = fruitArray[index]
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
            .sheet(item: $editFruit, onDismiss: {
//                self.editFruit.map { item in item.save() }
//                isPresentedEditVIew = false
            }) { editFruit in
                let _ = print(">>>editFruit",editFruit)
                EditView (
                    fruitNewItem: editFruit.name,
                    save: { name in
                        fruitArray[selectedIndex].name = name
                        fruitArray[selectedIndex].isChecked = false
                        print("~~~flag1",isPresentedEditVIew)
                        isPresentedEditVIew = false
                        print("~~~flag2",isPresentedEditVIew)
                    },
                    cancel: {
                        print("~~~flag3",isPresentedEditVIew)
                        isPresentedEditVIew = false
                        print("~~~flag4",isPresentedEditVIew)
                    }
                )
            }
        }
    }
    func didDismiss(){
        isPresentedEditVIew = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
