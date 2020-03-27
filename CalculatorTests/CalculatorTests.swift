//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Alexander on 25.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import Calculator

extension CalculatorView: Inspectable {  }
extension CalculatorButtonsRow: Inspectable {  }

// MARK: - Unit Tests View

final class CalculatorUnitTests: XCTestCase {
  
  let view = CalculatorView()
  
  // MARK: -  Values in buttons
  func test_initial_value_into_display() throws {
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_AC_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(0).text().string()
    XCTAssertEqual(string, "AC")
  }
  
  func test_plusMinus_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(1).text().string()
    XCTAssertEqual(string, "±")
    
  }
  
  func test_percent_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(2).text().string()
    XCTAssertEqual(string, "%")
  }
  
  func test_divide_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(3).text().string()
    XCTAssertEqual(string, "÷")
  }
  
  func test_seven_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(0).text().string()
    XCTAssertEqual(string, "7")
  }
  
  func test_eight_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(1).text().string()
    XCTAssertEqual(string, "8")
  }
  
  func test_nine_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(2).text().string()
    XCTAssertEqual(string, "9")
  }
  
  func test_multiply_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(3).text().string()
    XCTAssertEqual(string, "x")
  }
  
  func test_four_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(0).text().string()
    XCTAssertEqual(string, "4")
  }
  
  func test_five_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(1).text().string()
    XCTAssertEqual(string, "5")
  }
  
  func test_six_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(2).text().string()
    XCTAssertEqual(string, "6")
  }
  
  func test_minus_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(3).text().string()
    XCTAssertEqual(string, "-")
  }
  
  func test_one_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(0).text().string()
    XCTAssertEqual(string, "1")
  }
  
  func test_two_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(1).text().string()
    XCTAssertEqual(string, "2")
  }
  
  func test_three_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(2).text().string()
    XCTAssertEqual(string, "3")
  }
  
  func test_plus_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(3).text().string()
    XCTAssertEqual(string, "+")
  }
  
  func test_zero_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(0).text().string()
    XCTAssertEqual(string, "0")
  }
  
  func test_decimal_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(1).text().string()
    XCTAssertEqual(string, ".")
  }
  
  func test_equals_button_value() throws {
    let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(2).text().string()
    XCTAssertEqual(string, "=")
  }
  
  // MARK: - Unit Tests CalculatorViewModel
  
  let calculatorVM = CalculatorViewModel()
//  let buttons = CalculatorData().buttons
  
  //MARK: - checked AC
  
  func test_AC_behavior_by_firstExpression() {
    calculatorVM.firstExpression = "3"
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "AC"))
    XCTAssertEqual(calculatorVM.firstExpression, "")
  }
  
  func test_AC_behavior_by_secondExpression() {
    calculatorVM.secondExpression = "109"
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "AC"))
    XCTAssertEqual(calculatorVM.secondExpression, "")
  }
  
  func test_AC_behavior_by_pressedOperator() {
    calculatorVM.secondExpression = "+"
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "AC"))
    XCTAssertEqual(calculatorVM.pressedOperator, "")
  }
  
  func test_AC_behavior_by_display() {
    calculatorVM.display = "123.8"
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "AC"))
    XCTAssertEqual(calculatorVM.display, "0")
  }
  
  //MARK: - checked pressedOperator
  
  func test_plus_value_pressedOperator() {
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "+"))
    XCTAssertEqual(calculatorVM.pressedOperator, "+")
  }
  
  func test_multiply_value_pressedOperator() {
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "x"))
    XCTAssertEqual(calculatorVM.pressedOperator, "x")
  }
  
  func test_minus_value_pressedOperator() {
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "-"))
    XCTAssertEqual(calculatorVM.pressedOperator, "-")
  }
  
  func test_divide_value_pressedOperator() {
    _ = calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "÷"))
    XCTAssertEqual(calculatorVM.pressedOperator, "÷")
  }
  
  // MARK: - y + x = ...
  func test_equals_behavior_by_plus_Int()  {
    calculatorVM.firstExpression = "3"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "3"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "6")
  }
  
  func test_equals_behavior_by_plus_Double_integer()  {
    calculatorVM.firstExpression = "3.0"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "3.0"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "6")
  }
  
  func test_equals_behavior_by_plus_Double()  {
    calculatorVM.firstExpression = "3.3"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "3.4"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "6.7")
  }
  
  func test_equals_behavior_by_plus_Double_sumInteger()  {
    calculatorVM.firstExpression = "3.3"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "3.7"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "7")
  }
  
  func test_equals_behavior_by_plus_Int_less_zero()  {
    calculatorVM.firstExpression = "-5"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "2"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "-3")
  }
  
  func test_equals_behavior_by_plus_Int_greater_zero()  {
    calculatorVM.firstExpression = "-5"
    calculatorVM.pressedOperator = "+"
    calculatorVM.display = "10"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "5")
  }
  
  // MARK: - y - x = ...
  func test_equals_behavior_by_minus_Int()  {
    calculatorVM.firstExpression = "4"
    calculatorVM.pressedOperator = "-"
    calculatorVM.display = "3"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "1")
  }
  
  func test_equals_behavior_by_minus_Double_integer()  {
    calculatorVM.firstExpression = "4.0"
    calculatorVM.pressedOperator = "-"
    calculatorVM.display = "2.0"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "2")
  }
  
  func test_equals_behavior_by_minus_Double()  {
    calculatorVM.firstExpression = "6.3"
    calculatorVM.pressedOperator = "-"
    calculatorVM.display = "3.4"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "2.9")
  }
  
  func test_equals_behavior_by_minus_Double_sumInteger()  {
    calculatorVM.firstExpression = "4.3"
    calculatorVM.pressedOperator = "-"
    calculatorVM.display = "3.3"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "1")
  }
  
  // MARK: - y * x = ...
  
  func test_equals_behavior_by_multiply_Int()  {
    calculatorVM.firstExpression = "4"
    calculatorVM.pressedOperator = "x"
    calculatorVM.display = "3"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "12")
  }
  
  func test_equals_behavior_by_multiply_Double_integer()  {
    calculatorVM.firstExpression = "4.0"
    calculatorVM.pressedOperator = "x"
    calculatorVM.display = "2.0"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "8")
  }
  
  func test_equals_behavior_by_multiply_Double()  {
    calculatorVM.firstExpression = "6.3"
    calculatorVM.pressedOperator = "x"
    calculatorVM.display = "2.4"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "15.12")
  }
  
  func test_equals_behavior_by_multiply_Double_multiplyInteger()  {
    calculatorVM.firstExpression = "4.5"
    calculatorVM.pressedOperator = "x"
    calculatorVM.display = "10"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "45")
  }
  
  // MARK: - y / x = ...
  
  func test_equals_behavior_by_divide_Int()  {
    calculatorVM.firstExpression = "8"
    calculatorVM.pressedOperator = "÷"
    calculatorVM.display = "4"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "2")
  }
  
  func test_equals_behavior_by_divide_Double_integer()  {
    calculatorVM.firstExpression = "4.0"
    calculatorVM.pressedOperator = "÷"
    calculatorVM.display = "2.0"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "2")
  }
  
  func test_equals_behavior_by_divide_Double()  {
    calculatorVM.firstExpression = "150.48"
    calculatorVM.pressedOperator = "÷"
    calculatorVM.display = "3.3"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "45.6")
  }
  
  func test_equals_behavior_by_divide_Double_divideInteger()  {
    calculatorVM.firstExpression = "4.2"
    calculatorVM.pressedOperator = "÷"
    calculatorVM.display = "2.1"

    calculatorVM.receiveButtonPress(button: CalculatorButtonModel.init(title: "="))
    
    XCTAssertEqual(calculatorVM.display, "2")
  }
  
}

// MARK: - UI Tests

final class CalculatorUITests: XCTestCase {
  let view = CalculatorView()
  
  // MARK: - Button double tapped
  func test_AC_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(0)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_plusMinus_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(1)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "±")
  }
  
  func test_percent_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "%")
  }
  
  func test_divide_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(3)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_seven_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(0)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "77")
  }
  
  func test_eight_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(1)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "88")
  }
  
  func test_nine_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "99")
  }
  
  func test_multilply_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 1).hStack().forEach(0).button(3)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_four_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(0)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "44")
  }
  
  func test_five_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(1)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "55")
  }
  
  func test_six_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "66")
  }
  
  func test_minus_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 2).hStack().forEach(0).button(3)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_one_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(0)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "11")
  }
  
  func test_two_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(1)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "22")
  }
  
  func test_three_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "33")
  }
  
  func test_plus_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(3)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_zero_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(0)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_decimal_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(1)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0.")
  }
  
  func test_equals_button_double_tapped() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 4).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    XCTAssertEqual(display, "0")
  }
  
  func test_display_char_count() throws {
    let button = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 3).hStack().forEach(0).button(2)
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    try button.tap()
    let display = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
    let count = display?.count
    XCTAssertEqual(count, 8)
  }
}
