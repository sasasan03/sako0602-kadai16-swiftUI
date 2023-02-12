//
//  ContentView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

//キャプチャを使ってfruitIndexにButtonが押された後のindexを渡したい。
struct ContentView: View {
    
    @State private var isPresentedAddView = false
    @State private var isPresentedEditVIew = false
    @State var editFruit: FruitsData? = nil
   @State  var selectedIndex: Int = 0
//    @State var fruitIndex: () -> Int
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
//                                Text("\(fruitIndex)")
//                                   .foregroundColor(Color.white)
                            }
                        }
                        .foregroundColor(Color.black)
                        Spacer()
                        Button {
//                            print(">>>fruitIndex", fruitIndex)
//                            fruitIndex = capture(index: index)()//❌
//                            fruitIndex = index
//                            print("¥¥¥fruitIndex", fruitIndex)
//                            appDate(index: fruitIndex, text: fruitArray[fruitIndex].name)//🙆
//                            aaa(index: index) { num in
//                                fruitIndex
//                            }
                            selectedIndex = index
                            editFruit = fruitArray[index]
//                            appDate(index: fruitIndex, text: <#T##String#>)
                            
//                            fruitIndex = index
//                                fruitIndex = {
//                                    print(#function, index)
//                                    return index
//                                }
//                            fruitArray[fruitIndex].name = capture(index: index)()//🙆
//                            let checkNum = fruitIndex()
                           
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
//            .sheet(isPresented: $isPresentedAddView) {
//                FruitsAddView(
//                    save: { name in
//                        fruitArray.append(FruitsData(name: name, isChecked: false))
//                        isPresentedAddView = false
//                    } ,cancel: {
//                        isPresentedAddView = false
//                    }
//                )
//            }
            .sheet(item: $editFruit, content: { editFruit in
//                    $fruitArray[editFruit], content: { index in
                EditView (
                    fruitNewItem: editFruit.name,//ここで関数を読んで上書き
                    save: { name in
//                        print(">>>sheet", fruitIndex)
//                        print(">>>", fruitArray[fruitIndex()].name)
                        fruitArray[selectedIndex].name = name
                        fruitArray[selectedIndex].isChecked = false
                        isPresentedEditVIew = false
                    },
                    cancel: {
                        isPresentedEditVIew = false
                    }
                )
            })
//            .sheet(isPresented: $isPresentedEditVIew) {
//                let jjj = fruitIndex
//                let _ = print("|||", jjj)
//
//            }
        }
    }
    func appDate(index: Int, text: String) {
        fruitArray[index].name = text
    }
    func aaa(index: Int ,complition: (Int) -> Void ) {
        var fruitNum = 0
        fruitNum = index
        complition(fruitNum)
    }
}

extension Int: Identifiable {
    public var id: Int{
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
//            fruitIndex: 2
        )
    }
}
