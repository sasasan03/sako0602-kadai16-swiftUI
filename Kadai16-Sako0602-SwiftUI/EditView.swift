//
//  TestView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

struct EditView: View {
    
    @State var fruitName: String
//    @Binding var fruitData: FruitsData
    @State private var textFruits = ""
    let save: (String) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack{
            HStack{
                Text("名前")
                TextField("", text: $fruitName)
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
                        save(fruitName)
                    }
                }
            }
            .padding()
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(fruitName: "りんご", save: { _ in }, cancel: {})
    }
}
