//
//  SwiftUIView.swift
//  Kadai16-Sako0602-SwiftUI
//
//  Created by sako0602 on 2023/02/07.
//

import SwiftUI

struct SwiftUIView: View {
    @State var array = ["a","b","c"]
//    @State var number: (Int) -> Int
    @State var number = 0
    var body: some View {
        List {
            ForEach(array.indices, id: \.self) { index in
                Button {
                    print(">>>1",number)
//                    number = index
                    let bbb = aaa(index: index)
                    number = bbb()
                    print(">>>2",number)
                } label: {
                    Text(array[index])
                        .font(.largeTitle)
                }
            }
        }
    }
    func aaa(index: Int) -> (()-> Int) {
        return { () -> Int in
            number = index
            return number
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
