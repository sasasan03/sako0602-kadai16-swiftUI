import UIKit

//func firstIndex(where predicate: (UInt8) throws -> Bool) rethrows -> Int?
let students = ["Kofi", "bena", "Peter", "Kweku", "kosua"]
if let i = students.firstIndex(where: { $0.hasPrefix("A") }) {
    print(">>",i)
    print("\(students[i]) starts with 'A'!")
}
print("nil")//nil

//struct DataA: Identifiable {
//    let id = UUID()
//    var str: String
//}
//
//let array = [
//    DataA(str: "りんご"),
//    DataA(str: "もも"),
//    DataA(str: "スモモ")
//]

//var arrayA: DataA

//func getArrayIndex(){
//    guard let index = array.firstIndex(where: {
//        $0.id == array.id
//    }) else { return }
//    print(">>>index",index)
//}
