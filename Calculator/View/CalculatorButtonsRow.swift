//
//  CalculatorButtonsRow.swift
//  Calculator
//
//  Created by Alexander on 26.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CalculatorButtonsRow: View {
    let screenWidth: CGFloat
    let spacing: CGFloat
    let buttons: [CalculatorButtonModel]
    let pressedOperator: String
    
    func getButtonWidth(title: String) -> CGFloat {
        return title != "0" ? (self.screenWidth - self.spacing * 5) / 4 : (self.screenWidth - self.spacing * 5) / 4 * 2 + self.spacing
    }
    
    var didTapButton: (CalculatorButtonModel) -> ()
    
    var body: some View {
        HStack (spacing: self.spacing) {
            ForEach(self.buttons) { button in
                Button(action: {
                    self.didTapButton(button)
                }, label: {
                    Text(button.title)
                        .font(.system(size: 28))
                        .foregroundColor(button.title == self.pressedOperator ? .orange : .white)
                        .frame(width: self.getButtonWidth(title: button.title),
                               height: (self.screenWidth - self.spacing * 5) / 4)
                        .background(button.title == self.pressedOperator ? .white : button.color)
                        .cornerRadius(100)
                })
            }
        }
    }
}
