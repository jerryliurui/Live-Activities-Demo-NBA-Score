//
//  StringExtension.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/15.
//

import Foundation

extension String {
    public init(deviceToken: Data) {
        self = deviceToken.map { String(format: "%02x", $0) }.joined()
    }
}
