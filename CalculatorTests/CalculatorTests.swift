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

final class CalculatorTests: XCTestCase {

    func test_initial_value_into_display() throws {
        let view = CalculatorView()
        let string = try view.inspect().geometryReader().zStack().vStack(1).hStack(1).text(1).string()
        XCTAssertEqual(string, "0")
    }
    
    func test_initial_value_into_button_AC() throws {
            let view = CalculatorView()
        let string = try view.inspect().geometryReader().zStack().vStack(1).forEach(2).view(CalculatorButtonsRow.self, 0).hStack().forEach(0).button(0).text().string()
            XCTAssertEqual(string, "AC")
//            XCTAssertNotNil(string, "Did not find body")
            
        }

}
