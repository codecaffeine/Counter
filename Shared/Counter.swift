//
//  ContentView.swift
//  Shared
//
//  Created by Matt Thomas on 8/28/21.
//

import SwiftUI

struct Counter: View {
    @Binding var number: Float

    var body: some View {
        Text(CounterModifier.displayString(number)).modifier(CounterModifier(number: number))
    }
}

private struct CounterModifier: AnimatableModifier {
    var number: Float

    var animatableData: Float {
        get { number }
        set { number = newValue }
    }

    func body(content: Content) -> some View {
        return Text(Self.displayString(number))
    }

    static func displayString(_ number: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        return formatter.string(from: NSNumber(value: number)) ?? "0"
    }
}

struct NumberText_Previews: PreviewProvider {
    static var previews: some View {
        Counter(number: .constant(20))
    }
}
