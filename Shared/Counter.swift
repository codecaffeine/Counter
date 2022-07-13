//
//  ContentView.swift
//  Shared
//
//  Created by Matt Thomas on 8/28/21.
//

import SwiftUI

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

private struct CounterModifier: Animatable, ViewModifier {
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

struct RandomTextLabel: Animatable, View {
    var string: String
    var number: Double

    var animatableData: Double {
        get { number }
        set { number = newValue }
    }

    var body: some View {
        Text(CounterModifier.displayString(number, formatter: formatter))
            .modifier(CounterModifier(number: number, formatter: formatter))
    }
}
