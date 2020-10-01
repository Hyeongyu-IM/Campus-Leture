import UIKit

var str = "Hello, playground"

let value = arc4random_uniform(10); +1
print("--> \(value)")

// --- Tuple
let coordinates = (4, 6)

let x = coordinates.0
let y = coordinates.1

let coorninatesNamed = (x:2, y:3)

let x2 = coorninatesNamed.x
let y2 = coorninatesNamed.y

let (x3, y3) = coorninatesNamed

x3
y3


// --- Boolean

let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> 참")
} else {
    print("---> 거짓")
}

let a = 5
let b = 10

if a > b {
    print("--> a가 크다")
} else {
    print("--> b가 크다")
}

let name1 = "jin"
let name2 = "Jason"

if (name1 == "jin") {
    print("same")
}

let isTwoNameSame = name1 != name2

if isTwoNameSame {
    print("--> 이름이 같다")
} else {
    print("--> 이름이 다르다")
}

let isjason = name2 == "Jason"

let greetingMessage: String = isjason ? "Hello Jason" : "Hello somebody"

// --- Scope

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extrahours = hours - 40
    salary += extrahours * payPerHour * 2
    hours = hours - extrahours
}

salary = salary + hours * payPerHour


