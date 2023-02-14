//
//  HashableSynthesizable.swift
//  BookReader
//
//  Created by standard on 2/11/23.
//

import Foundation

public protocol HashableSynthesizable: Hashable {}

extension HashableSynthesizable {
    public static func == (hashable0: Self, hashable1: Self) -> Bool {
        zip(hashable0.hashables, hashable1.hashables).allSatisfy(==)
    }

    public func hash(into hasher: inout Hasher) {
        hashables.forEach { hasher.combine($0) }
    }
}

extension HashableSynthesizable {
    fileprivate var hashables: [AnyHashable] {
        Mirror(reflecting: self).children
            .compactMap { $0.value as? AnyHashable }
    }
}
