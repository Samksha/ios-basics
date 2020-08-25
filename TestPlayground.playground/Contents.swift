import Cocoa

let numberOfLights: Int = 4
var population: Int
population = 544
let townName: String = "Knowhere"
let townDescription = "\(townName) has a population of \(population) and \(numberOfLights) lights."
print(townDescription)


var message: String
if(population < 1000) {
    message = "\(population) is a small town"
}
else{
    message = "\(population) is pretty big"
}
print(message)

var hasPostOffice: Bool = false
if !hasPostOffice {
    print("Where do we buy stamps?")
}

message = population < 1000 ? "\(population) is a small town" : "\(population) is pretty big"
print(message)

//Switch Case
var statusCode: Int = 418
var statusMessage: String = "The request failed:"
switch statusCode {
case 100, 101:
    statusMessage += " Informational, \(statusCode)."
case 204:
    statusMessage += " Succesful but no content, 204."
case 300...307:
    statusMessage += " Redirection, \(statusCode)."
case 400...417:
    statusMessage += " Client error, \(statusCode)."
case 500...505:
    statusMessage += " Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    statusMessage = "\(unknownCode) is not a known error code."
default:
    statusMessage = "Unexpected error."
}
let error = (code: statusCode, error: statusMessage)

//Loops
var i: Int = 0

for _ in 1...5 {
    i += 1
    i
    print(i)
}

//Dicitionary and Sets
var dictionaryOfCapitals2: Dictionary<String, String>
var dictionaryOfCapitals: [String: String] = [:]
var setOfCapitals: Set<String> = []

//Optionals
var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 8.2
reading2 = 9.3
//reading3 = 7.9

if let r1 = reading1,
    let r2 = reading2,
    let r3 = reading3 {
        let avgReading = (r1+r2+r3)/3
        print(avgReading)
} else {
    print("Error")
}

enum PieType {
    case apple
    case peach
}

let favPie = PieType.apple
let name: String

switch favPie {
case .apple:
    name = "Apple"
case .peach:
    name = "Peach"
}

let compareAscending = {
    (i: Int, j:Int) -> Bool in
    return i < j
}

var nums = [42, 8, -12, 17]
nums.sort(by: compareAscending)
