//
//  TestView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/28.
//

import SwiftUI

struct EditView: View {
    
    @State private var textNewItem = ""
    @State private var textNum = 0
    let save: (String) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack{
            HStack{
                Text("名前の変更")
                TextField("", text: $textNewItem)
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

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(save: { _  in }, cancel: {})
    }
}
