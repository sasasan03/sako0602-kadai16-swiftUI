import UIKit
import SwiftUI



//     (Int) -> Intはクロージャー
func k(number: Int) -> Int { //() -> Stringで戻り値を設定しているためreturnが一つ必要。
    let num = 2
    return  number + num//returnが一つ
}

let a: Int? = 1
let b = a!
if let unwrappedA = a {
    unwrappedA + 2
}

k(number: 4) //6
let ggg = 7
var sum: Int = 1
func a( _ x: (Int) -> Int) {
    print("1")
    let iii = 3
    print("2")
    let num = x(ggg)//引数のクロージャーをインスタンス化させる
    sum = num + iii //10←実行される順番を間違えてる（正）: 19
//    x = { //letと同じ振る舞いをするため、代入は不可能❌
//    }//インスタンスさせるか、引数をそのまま使うかのどちらかしかない？
       //インスタンス化させて使うとメリットはあるのあるのか？
}

a { index in //index =  7 <- ggg
    print("3")
    let kkk = 5
    return index + 4 + kkk//16
}
sum //19 ok
//iii ❌
//kkk ❌


// ②
func multiply(X: () -> Int) -> Int {

    print("multiply関数を実行しました")//1
    // ③
    var answerNumber: Int = X()
    print("プロパティのクロージャーを実行")//4
    // ⑤
    if answerNumber >= 5 {
        answerNumber *= 2
        print(answerNumber)
        return answerNumber
    } else {
        print(answerNumber)
        print("処理終了")//5
        return answerNumber
    }
    
}

// ④
func add(_ number: Int) -> Int {
    var number = 2
    print("add関数を実行しました")//3
    return number + 1
} //() -> Int ok

var a: Int = 3 + 3 //ok
// ①
multiply {
    print("処理開始")//2
    return add(3)
}//引数をクロージャーに持つ場合は{}で引数を書かないといけない？

// (実行結果)
// multiply関数を実行しました
// add関数を実行しました
// 10
