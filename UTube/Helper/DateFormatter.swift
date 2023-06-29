//
//  DateFormatter.swift
//  UTube
//
//  Created by Minh Tan Vu on 29/06/2023.
//

import Foundation

extension DateFormatter {
    static func dateFormat(from date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormater.string(from: date)
    }
}
