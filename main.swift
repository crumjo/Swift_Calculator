/***********************************************************************
 * This is a simple calculator that keeps a running total. This
 * Calculator supports addition, subtraction, multiplication, division,
 * and exponents.
 *
 * @author Joshua Crum
 * @version 12/9/17
 ***********************************************************************/

import Foundation
import Darwin

var run_var = 0.0
var i = 0
var checkInit = 0
var opPos = 1
var varPos = 2

print("Weclome to the simple calculator!")
print("First, enter a calculation in this form: <var> <operation> <var>")
print("Then type <operation> <var> to keep a running calculation.")
print("Supported commands: +, -, *, /, ^ (exponent)\n")

while (i == 0) {
    let input: String? = readLine()
    let stringArray = input!.components(separatedBy: " ")
    
    if (checkInit == 0) {
        run_var = (stringArray[0] as NSString).doubleValue
        checkInit = checkInit + 1
    }
    
    if (stringArray[0].lowercased() == "q") {
        print("The calculator will now exit.\n")
        exit(0)
    } else if (stringArray[opPos] == "+") {
        run_var += (stringArray[varPos] as NSString).doubleValue
    
    } else if (stringArray[opPos] == "-") {
        run_var -= (stringArray[varPos] as NSString).doubleValue
    
    } else if (stringArray[opPos] == "*") {
        run_var *= (stringArray[varPos] as NSString).doubleValue
    
    } else if (stringArray[opPos] == "/") {
        let x = (stringArray[varPos] as NSString).doubleValue
        if (x == 0) {
            print("Cannot divide by zero.\n")
        } else {
            run_var /= x
        }
    
    } else if (stringArray[opPos] == "^") {
        run_var = pow(run_var, (stringArray[varPos] as NSString).doubleValue)
    }
    
    print("Total: \(run_var)\n")
    
    if (checkInit == 1) {
        opPos = 0
        varPos = 1
    }

}
