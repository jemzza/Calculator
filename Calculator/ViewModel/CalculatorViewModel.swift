//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Alexander on 25.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var display = CalculatorViewModel.defaultDisplay
    @Published var pressedOperator = ""
    
    static let defaultDisplay = "0"
    
    var firstExpression = ""
    var secondExpression = ""
    
    func receiveButtonPress(button: CalculatorButtonModel) {
        if button.title == "AC" {
            display = CalculatorViewModel.defaultDisplay
            firstExpression = ""
            secondExpression = ""
            pressedOperator = ""
            return
        }
        
        if button.title == "+" || button.title == "x" || button.title == "-" || button.title == "÷" {
            pressedOperator = button.title
            return
        }
        
        if button.title == "=" {
            let first = Double(firstExpression) ?? 0
            let second = Double(display) ?? 0
            
            if pressedOperator == "+" {
                display = "\(first + second)"
            } else if pressedOperator == "-" {
                display = "\(first - second)"
            } else if pressedOperator == "x" {
                display = "\(first * second)"
            } else if pressedOperator == "÷" {
                display = "\(first / second)"
            }
            
            firstExpression = display
            secondExpression = ""
            pressedOperator = ""
            
            return
        }
        
        if pressedOperator.isEmpty {
            if display == CalculatorViewModel.defaultDisplay {
                display = button.title
            } else {
                display += button.title
            }
            firstExpression = display
        } else {
            if secondExpression.isEmpty {
                display = button.title
            } else {
                display += button.title
            }
            secondExpression = display
        }
    }
}

