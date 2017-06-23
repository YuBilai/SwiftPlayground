//: Playground - noun: a place where people can play

import UIKit

let scores = [90,30,66,99]

var temScore = 0

for score in scores {
    if score > 59 {
        temScore += 10
    }
    else{
        temScore += 1
    }
}
temScore

//判断值的可选操作
var optionalString: String? = "swift"

optionalString = nil

var optionalName : String? = "name"

var greeting = "How are you"

if let name = optionalString {
    greeting = "Hellow,\(name)"
}else{
    greeting = "Hellow,\(optionalString)"
}

//Switch支持任意类型的数据以及各种操作比较-----不仅仅是整数以及测试相等
let vegetable = "red people"

switch vegetable {
case "celery":
    let vegetableComment = "add some raisins and make ants on a log"
case "cucumber","watercress":
    let vegetableComment = "that would make a good tea sandwich"
case let x where x.hasSuffix("people"):
    let vegetableComment = "Is it a spicy \(x)"
default:
    let vegetableComment = "Everything tastes good in soup"
}
//swift 中的switch语句不需要break

//for-in遍历字典 需要两个变量来表示每个键值对
let interestingNumber = ["Prim" : [2,3,4,5,7,8],"Fibonacci" : [1,3,5,6,99],"Square" : [1,4,9,16,2]]
var largest = 0;
var largestChange :String? = nil
for (kind,numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
            largestChange = kind
        }
    }
}
largest
largestChange

//while和do-while语句
var n = 2
while n < 100 {
    n = n * 2
}
n


var m = 2;
repeat {
    m = m * 6
} while m < 4
m

//for循环
var firstForLoop = 0
for i in 0..<100 {
    firstForLoop += i
}
firstForLoop

for i in 0...10{
    firstForLoop += i;
}
firstForLoop


/* swift 3.0已经废弃
var secondForLoop = 0
for var i = 0; i < 100; i++ {
    secondForLoop += 1
}
secondForLoop
*/

//使用元祖返回多个值
func getGadPrices() -> (Double,Double,Double){
    return(3.0,3.98,9.21)
}
getGadPrices()

//函数的参数数量是可变的，用一个数组来获取他们
func sumOf(numbers : Int...) -> Int{
    var sum = 0
    for i in numbers{
        sum += i
    }
    return sum
}
sumOf()
sumOf(numbers: 47,28,29)

//计算参数平均值
func getAverage(numbers : Int...) ->Int{
    var sum = 0
    for number in numbers {
       sum += number
    }
    return sum/numbers.count
}
getAverage(numbers: 99,101,100,80,120)

//函数嵌套函数
func getFifTeen(number1 : Int,number2 : Int) -> (Int){
    func add() -> Int{
        return number1 + number2
    }
    return add()
}
getFifTeen(number1: 10, number2: 5)

//函数用作函参数
func getSum(number4 : Int) -> Int{
    return number4
}
getSum(number4: getFifTeen(number1: 10, number2: 5))

//☆☆☆☆函数当做参数传入另外一个函数
func hasAnyMatches(list : [Int],condition : (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true;
        }
    }
    return false;
}
func lessThanTen(number : Int) -> Bool{
    return number < 10;
}
var numbers2 = [20,19,7,12]
hasAnyMatches(list: numbers2, condition: lessThanTen(number:))

//闭包
var numbers = [13,20,4,5,9]
numbers.map { (number : Int) -> Int in
    var final = 0
    if number % 2 == 0{
        let result = 3 * number
        final = result;
    }else{
        let result = 0
        final = result
    }
    return final
}
numbers

//重写闭包  对所有奇数返回0
numbers.map { (number : Int) -> Int in
    var final = 0
    if number % 2 == 0 {
        final = number
    }else{
    
        final = 0
    }
    return final
}
//闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值，单个语句闭包会把他语句的值当做返回结果，当一个闭包作为最后一个参数传给一个函数的时候，他可以直接跟在括号后面。
let mappedNumbers = numbers.map({ number2 in 3 * number2 })
print(mappedNumbers)

let sortedNumbers = numbers.sorted(){$0 < $1}
print(sortedNumbers)

//类
class Shape{
    var numberOfSides = 0;
    func simleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    let nameOfClass = "Shape";
    func getClassName(name : String) -> String {
        return "this class name is \(name) or \(nameOfClass)."
    }
    
}
var shape = Shape()
shape.numberOfSides = 7
var shapDescription = shape.simleDescription()
var className = shape.getClassName(name: "shap")

//使用init来给类创建一个构造器
class NamedShape{
    var numberOfSides = 0;
    var name : String;
    
    init(name : String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
}

//子类继承父类以及用override重写父类的方法
class Square : NamedShape{
    var sideLength : Double
    //构造器
    init(sideLegth : Double,name : String) {
        self.sideLength = sideLegth
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "b square with sides of length \(sideLength)"
    }
}
let testOfSquare = Square(sideLegth : 5.2,name : "小明");
testOfSquare.area()
testOfSquare.simpleDescription()

//属性的set(新值得名字是newValue)、get方法
class EquilateralTriangle : NamedShape{
    var sideLength = 0.0;
    init(sidelength : Double,name : String) {
        self.sideLength = sidelength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter : Double{
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sidelength : 3.1,name : "A triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

//☆☆☆☆willSet和didSet（不需要计算属性但是需要在设置一个新值之前运行一些代码）
//eg：确保三角行的边长总是和正方形的边长相同、
class TriangleAndSquare{
    var triangle : EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square : Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size : Double,name : String) {
        square = Square(sideLegth: size, name: name)
        triangle = EquilateralTriangle(sidelength: size, name: name)
    }
    
}
var triangleAndSquare = TriangleAndSquare(size: 15, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLegth: 20, name: "larger square")
triangleAndSquare.triangle.sideLength

//可选值?
let optionalSquare : Square? = Square(sideLegth: 15, name: "optional square")
let sideLength = optionalSquare?.sideLength

//枚举和结构体(rawValue:原始值)
enum Rank : Int{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Four
let aceRawValue = ace.rawValue

//原始值和枚举值之间的相互转换
if let convertedRank = Rank(rawValue : 12) {
    let threeDescription = convertedRank.simpleDescription()
}

//若原始值没有意义，可以不用设置
enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color(simpleDescription : String) -> String {
        switch simpleDescription {
        case "spades","clubs":
            return "black"
        default:
            return "red"
        }
    }
    
}
let hearts = Suit.Spades
let heartsDescription = hearts.simpleDescription()
let color = hearts.color(simpleDescription: heartsDescription)

//☆☆☆☆☆
//实例值和枚举值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
//例如：从服务器获取日出和日落时间。服务器会返回正常结果或者错误信息。
enum SeverResponse{
    case result (String,String)
    case failure(String)
}
let success = SeverResponse.result("6:00 am", "8:09 pm")
let failure = SeverResponse.failure("Out of cheese")
switch success {
case let .result(sunrise,sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")

}

//结构体(结构体是传值，类是传引用)
struct Card{
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}
let threeOfSpeades = Card(rank: .Ace, suit: .Clubs)
let threeOfSpadesDescription = threeOfSpeades.simpleDescription()

//接口和拓展
protocol ExampleProtocol{
    var simpleDescription : String { get }
    mutating func adjust()
}
//类、枚举和结构体都可以实现接口
class SimpleClass : ExampleProtocol{
    var simpleDescription: String = "A very simple class."
    var anotherProperty = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let  aDescription = a.simpleDescription

//结构体实现接口(mutating 标记一个会修改结构体的方法)
struct SimpleStruct : ExampleProtocol{
    var simpleDescription : String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

#if false
//枚举实现(未实现)
enum SimpleEnum : ExampleProtocol{
    var simpleDescription: String
    case isEnum
    func adjust() {
        switch self {
        case .isEnum:
            simpleDescription += " (adjusted)"
        }
    }
}
var c = SimpleEnum.isEnum
c.adjust()
#endif

//Extension为现有的类型添加功能
extension Int : ExampleProtocol{
    var simpleDescription : String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42;
    }
}
7.simpleDescription

//即使ProtocolValue变量运行时的类型是simpleClass，编译器会把它的类型当做ExampleProtocol。这个表示你不能调用类在它实现的接口之外实现的方法或者属性
let protocolValue : ExampleProtocol = a
protocolValue.simpleDescription

//throw 捕捉异常
enum PrinterError : Error{
    case outOfpaper
    case noToner
    case onFire
}
func sendsss(job : Int,toPrinter printerName : String) throws -> String{
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

//try - catch
do {
    let printerResponse = try sendsss(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
}catch{
    print(error)
}

//catch的多样化处理
do{
    let printerResponse = try sendsss(job: 90, toPrinter: "Never Has Toner")
    print(printerResponse)
    
}catch PrinterError.onFire{
    print("I'll just put this over here ,with the rest of the fire")
}catch let printerError as PrinterError{
    print("Printer error:\(printerError)")
}catch{
    print(error)
}

//try? (可选)
let printerSuccess = try? sendsss(job: 30, toPrinter: "Mergenthaler")
let printerFailure = try? sendsss(job: 45, toPrinter: "Never Has Toner")


//defer 延迟代码块内容最后执行
var fridgeIsOpen = false;
let fridgeContent = ["milk","eggs","leftovers"]
func fridgeCintains(_ food : String) -> Bool{
    fridgeIsOpen = true
    print("defer before")
    defer{
        fridgeIsOpen = false
        print("defer content、")
    }
    let result = fridgeContent.contains(food)
    print("defer later")
    return result
    
}
fridgeCintains("banana")
print(fridgeIsOpen)

//泛型（在尖括号里面写一个名字来创建一个泛型函数或者类型）
func makeArray<Item>(repeating item : Item, numberOfTimes : Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//泛型枚举
enum OptionalValue<Wrapped>{
    case none
    case some(Wrapped)
}
var possibleInteger : OptionalValue<Int> = .none
possibleInteger = .some(100)

//☆☆☆☆☆利用where来制定需求列表
//eg:限定实现一个协议的类型，需要限定两个类型要相同，或者限定一个类必须有一个特定的父类
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs{
        for rhsItem in rhs {
            if rhsItem == lhsItem {
                return true;
            }
        }
    }
    return false;
}
anyCommonElements([1,2,3], [3])

//类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max

//数字字符串转整型
let string = "123"
let number = Int(string)

let serverResponseCode: Int? = 404

//断言
assert(serverResponseCode == 404, "网页没找到、")





