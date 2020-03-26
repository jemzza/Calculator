//
//  CalculatorView.swift
//  Calculator
//
//  Created by Alexander on 25.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    
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
