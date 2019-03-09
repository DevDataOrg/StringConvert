import UIKit
import Foundation

//converting a String with a comma to a String with a decimal
//Конвертируем String


//Variant 1
extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}


"2.25".doubleValue // 2.25
"2,25".doubleValue // 2.25

let price = "2,25"
let costString = String(format:"%.2f", price.doubleValue)   // "2.25"

//Varian 2
//You should do the currency formatting also with NumberFormat, so create a read-only computed property currency extending FloatingPoint protocol to return a formatted string from the String doubleValue property.

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}
extension Formatter {
    static let currency = NumberFormatter(style: .currency)
}
extension FloatingPoint {
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
}
let costStringConvert = "2,25".doubleValue.currency   // "$2.25"
Formatter.currency.locale = Locale(identifier: "en_US")
"2222.25".doubleValue.currency    // "$2,222.25"
"2222,25".doubleValue.currency    // "$2,222.25"

Formatter.currency.locale = Locale(identifier: "pt_BR")
"2222.25".doubleValue.currency    // "R$2.222,25"
"2222,25".doubleValue.currency    // "R$2.222,25"


//Variant 3

var price = "2,25"
price = price.replacingOccurrences(of: ".", with: ",")
var priceFloat = (price as NSString).floatValue
