//
//  CalculatorView.swift
//  Calculator
//
//  Created by Alexander on 25.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    let buttons = CalculatorData().buttons
    let spacing: CGFloat = 12
    
    @ObservedObject var calculatorVM = CalculatorViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack (spacing: self.spacing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(self.calculatorVM.display)
                            .foregroundColor(.white)
                            .font(.system(size: 74))
                            .multilineTextAlignment(.trailing)
                    }.padding(.horizontal, self.spacing)
                    ForEach(self.buttons, id: \.self) { row in
                        CalculatorButtonsRow(screenWidth: geometry.size.width, spacing: self.spacing, buttons: row, pressedOperator: self.calculatorVM.pressedOperator, didTapButton: { calcButton in
                            self.calculatorVM.receiveButtonPress(button: calcButton)
                        })
                    }
                }
            }
        }
    }
}
