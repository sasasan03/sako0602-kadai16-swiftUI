//
//  FruitRowView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/01/29.
//

import SwiftUI

struct FruitRowView: View {
    
    @State var fruit: FruitsData 
    @State private var isPresented = false
    
    var body: some View {
        HStack{
            HStack{
                Button {
                    fruit.isChecked.toggle()
                } label: {
                    HStack{
                        Image(systemName: fruit.isChecked
                              ? "checkmark"
                              : ""
                        )
                        .foregroundColor(Color.red)
                        .frame(width: 30, height: 30)
                        Text(fruit.name)
                    }
                }
                .foregroundColor(Color.black)
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .sheet(isPresented: $isPresented) {
            EditView(fruit: $fruit) { name in 
                fruit.name = name
                fruit.isChecked = false
                isPresented = false
            } cancel: {
                isPresented = false
            }

        }
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: FruitsData(name: "りんご", isChecked: false))
    }
}
