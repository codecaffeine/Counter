//
//  NumberFormatter.swift
//  Counter
//
//  Created by Matt Thomas on 4/1/22.
//

import Foundation

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
