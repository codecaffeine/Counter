//
//  ContentView.swift
//  Shared
//
//  Created by Matt Thomas on 8/28/21.
//

import SwiftUI

enum NumberFormat {
    case integer
    case decimal(Int)
    case currency
    case percent
    case custom(NumberFormatter)

    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        switch self {
        case .currency:
            formatter.numberStyle = .currency

        case .decimal(let fractionalDigits):
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = fractionalDigits
            formatter.maximumFractionDigits = fractionalDigits

        case .integer:
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0

        case .percent:
            formatter.numberStyle = .percent
            
        case .custom(let customFormatter):
            return customFormatter
        }

        return formatter
    }
}

struct Counter: View {
    @Binding var number: Double
    private var formatter: NumberFormatter

    init(_ number: Binding<Double>, format: NumberFormat = .integer) {
        _number = number
        formatter = format.formatter
    }

    var body: some View {
        Text(CounterModifier.displayString(number, formatter: formatter))
            .modifier(CounterModifier(number: number, formatter: formatter))
    }
}

private struct CounterModifier: AnimatableModifier {
    var number: Double
    let formatter: NumberFormatter

    var animatableData: Double {
        get { number }
        set { number = newValue }
    }

    func body(content: Content) -> some View {
        return Text(Self.displayString(number, formatter: formatter))
    }

    static func displayString(_ number: Double, formatter: NumberFormatter) -> String {
        formatter.string(from: NSNumber(value: number)) ?? "0"
    }
}

struct NumberText_Previews: PreviewProvider {
    static var previews: some View {
        Counter(.constant(20))
    }
}
