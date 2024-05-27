//
//  ColorCache.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 15/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

final class ColorCache<ValueType: AnyObject> {
    private let cache = NSCache<NSNumber, ValueType>()

    lazy var notificationCenter = NotificationCenter.default

    deinit {
        notificationCenter.removeObserver(self)
    }

    subscript(key: Int) -> ValueType? {
        get {
            cache.object(forKey: NSNumber(value: key)) as ValueType?
        }
        set {
            if let value: ValueType = newValue {
                cache.setObject(value, forKey: NSNumber(value: key))
            } else {
                cache.removeObject(forKey: NSNumber(value: key))
            }
        }
    }
}
