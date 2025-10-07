//
//  DateExt.swift
//  Winstagram4
//
//  Created by jibril harris on 7/15/25.
//

import Foundation

extension Date {
    func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
