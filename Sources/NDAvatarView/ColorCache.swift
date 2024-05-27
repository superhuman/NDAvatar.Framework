//
//  ColorCache.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 15/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import UIKit

final class ColorCache {
    private let cache = NSCache<NSNumber, UIColor>()

    subscript(key: Int) -> UIColor? {
        get {
            cache.object(forKey: key as NSNumber)
        }
        set {
            if let newValue {
                cache.setObject(newValue, forKey: key as NSNumber)
            } else {
                cache.removeObject(forKey: key as NSNumber)
            }
        }
    }
}
