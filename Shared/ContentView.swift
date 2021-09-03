//
//  ContentView.swift
//  Counter
//
//  Created by Matt Thomas on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var value: Float = 2.3

    var body: some View {
        VStack {
            Counter(number: $value)
                .font(.system(.body, design: .monospaced))
            Button {
                withAnimation {
                    value = value * value
                }
            } label: {
                Text("Change")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
