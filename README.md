# StringConvert
How can converting a String with a comma to a String with a decimal

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
