//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count == 1{
            return 0
        }
        else if args[args.endIndex - 1].count > 1 {
            switch args[args.endIndex - 1] {
            case "count":
                return args.count - 1
            case "avg":
                var sum = 0;
                for index in args.indices.dropLast(){
                    sum += Int(args[index])!
                }
                return sum/(args.count-1)
            case "fact":
                if Int(args[0])!==1 || Int(args[0])!==0{
                    return 1
                }
                else {
                    var temp = Int(args[0])!
                    var product = temp
                    while temp != 1 {
                        product = product * (temp - 1)
                        temp = temp - 1
                    }
                    return product
                }
            default:
                return 0
            }
        }
        else {
            switch args[1] {
            case "+":
                return Int(args[0])!+Int(args[2])!
            case "-":
                return Int(args[0])!-Int(args[2])!
            case "/":
                return Int(args[0])!/Int(args[2])!
            case "%":
                return Int(args[0])!%Int(args[2])!
            case "*":
                return Int(args[0])!*Int(args[2])!
            default:
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

