//
//  Formatters.swift
//  spaceX
//
//  Created by Marco Celestino on 18/02/2021.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

let mediumStyleDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

let usDollarFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.init(identifier: "en_US")
    formatter.alwaysShowsDecimalSeparator = true
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
    return formatter
}()
