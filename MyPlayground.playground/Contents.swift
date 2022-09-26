import UIKit

var greeting = "Hello, playground"

var a: Double = 10

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
print(a.stringWithoutZeroFraction)
