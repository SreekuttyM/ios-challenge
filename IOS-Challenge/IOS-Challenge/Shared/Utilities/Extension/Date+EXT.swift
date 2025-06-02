//
//  Date+EXT.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation


extension DateFormatter {
    static func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium   // e.g., Jan 2, 2025
        formatter.timeStyle = .short    // e.g., 3:45 PM
        return formatter.string(from: date)
    }
}
