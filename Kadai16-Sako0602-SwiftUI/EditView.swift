//
//  TestView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

struct EditView: View {
    
    @Binding var fruit: FruitsData
    @State private var textNewItem = ""
    let save: (String) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack{
            HStack{
                Text("名前")
                TextField(fruit.name, text: $textNewItem)
                    .frame(width: 210,height: 50)
                    .border(Color.black)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        cancel()
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("save"){
                        save(textNewItem)
                    }
                }
            }
            .padding()
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(fruit: Binding<FruitsData>.constant(FruitsData(name: "りんご", isChecked: false)), save: { _  in }, cancel: {})
    }
}
