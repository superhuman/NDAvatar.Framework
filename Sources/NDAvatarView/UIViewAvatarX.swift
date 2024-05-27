//
//  UIViewAvatarX.swift
//  DesignableX
//
//  Created by Mark Moeykens on 12/31/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//
#if !os(macOS)
import UIKit

@IBDesignable
public final class UIViewAvatarX: UIView {

    // MARK: - Gradient

    @IBInspectable public var firstColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable public var secondColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable public var horizontalGradient = false {
        didSet {
            updateView()
        }
    }

    override public class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    @IBInspectable public var background = UIColor.clear {
        didSet {
            layer.backgroundColor = background.cgColor
        }
    }

    // MARK: - Border

    @IBInspectable public var borderColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable public var maskToBounds: Bool {
        get {
            layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }

    private func updateView() {
        let layer = layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, secondColor.cgColor]

        if horizontalGradient {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = .zero
            layer.endPoint = CGPoint(x: 0, y: 0.5)
        }
    }
}
#endif
