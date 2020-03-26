//
//  CalculatorButtonModel.swift
//  Calculator
//
//  Created by Alexander on 26.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CalculatorButtonModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var color: Color = .darkGray
}
