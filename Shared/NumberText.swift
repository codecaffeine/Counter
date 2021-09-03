//
//  ContentView.swift
//  Shared
//
//  Created by Matt Thomas on 8/28/21.
//

import SwiftUI

struct NumberText: View {
    let start: Int
    let end: Int
    @ObservedObject var generator: ValueGenerator

    init(_ number: Int, end: Int) {
        self.start = number
        self.end = end
        generator = ValueGenerator(start: number, end: end)
        generator.run()
    }

    var body: some View {
        Text("\(generator.currentValue)")
            .padding()
    }
}

class ValueGenerator: ObservableObject {
    @Published var currentValue: Int
    let start: Int
    let end: Int

    private var iterator: IndexingIterator<Range<Int>>
    private var runCount: Int

    init(start: Int, end: Int) {
        self.start = start
        self.end = end

        let range = start..<end

        iterator = range.makeIterator()
        self.runCount = (start..<end).count
        currentValue = start
    }

    func run() {
        Timer.scheduledTimer(withTimeInterval: 0.007, repeats: true) { timer in
            if let nextValue = self.iterator.next() {
                self.currentValue = nextValue
            }
            else {
                timer.invalidate()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NumberText(1, end: 100)
    }
}
