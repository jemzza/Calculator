//
//  CalculatorButtonModel.swift
//  Calculator
//
//  Created by Alexander on 26.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

protocol Buttons {
    var buttons: [[CalculatorButtonModel]] { get }
}

struct CalculatorButtonModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var color: Color = .darkGray
}

class CalculatorData: Buttons {
    let buttons: [[CalculatorButtonModel]] = [
        [.init(title: "AC", color: .lightGray),
         .init(title: "±", color: .lightGray),
         .init(title: "%", color: .lightGray),
         .init(title: "÷", color: Color.orange)],
        [.init(title: "7"),
         .init(title: "8"),
         .init(title: "9"),
         .init(title: "x", color: Color.orange)],
        [.init(title: "4"),
         .init(title: "5"),
         .init(title: "6"),
         .init(title: "-", color: Color.orange) ],
        [.init(title: "1"),
         .init(title: "2"),
         .init(title: "3"),
         .init(title: "+", color: Color.orange)],
        [.init(title: "0"),
         .init(title: "."),
         .init(title: "=", color: Color.orange)]
    ]
}
