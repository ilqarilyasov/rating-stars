//
//  CustomControl.swift
//  RatingStars
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    var starLabels = [UILabel]()
    
    // MARK: - Initializer
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        for n in 0...componentCount {
            let size = CGSize(width: componentDimension, height: componentDimension)
            
            let location = n * Int((bounds.maxX / 10))
            let gap = Int(bounds.maxX / 5)
            let origin = CGPoint(x: location + gap, y: Int(bounds.size.height / 2))
            let frame = CGRect(origin: origin, size: size)
            
            let label = UILabel(frame: frame)
            label.tag = n + 1
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✩"
            label.textAlignment = .center
            
            label.textColor = label.tag == 1 ? componentActiveColor : componentInactiveColor
            
            addSubview(label)
            starLabels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Private methods
    
    private func updateValue(at touch: UITouch) {
        
    }
    
}
