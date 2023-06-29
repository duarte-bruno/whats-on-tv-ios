//
//  WotLabel.swift
//  
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore

public class WotLabel: UILabel {

    // MARK: - Public properties
    
    public override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (insets.left + insets.right)
        }
    }
    
    // MARK: - Private properties
    
    private var insets: UIEdgeInsets
    
    // MARK: - init
    
    public init(text: String) {
        self.insets = UIEdgeInsets.zero
        super.init(frame: .zero)
        
        self.text = text
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.textAlignment = .left
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
    
    
    
    // MARK: - Public methods
    
    public func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}

public class WotBoldLabel: WotLabel {

    public override init(text: String) {
        super.init(text: text)
        
        self.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
}

public class WotTitleLabel: WotLabel {

    public override init(text: String) {
        super.init(text: text)
        
        self.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
}
