//
//  WotGenericScrollContentView.swift
//  
//
//  Created by Bruno Duarte on 29/06/23.
//

import UIKit
import WotCore

/// A generic view with a scroll view and a stack view inside.
public class WotGenericScrollContentView: UIView {
    
    // MARK: - Public properties
    
    /// Insert all content you want inside this stackview.
    public let contentStackView: UIStackView
    
    // MARK: - Init
    
    public init() {
        self.contentStackView = UIStackView()
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(StrError.InitCoderNotImplemented.l)
    }
    
    // MARK: - Private methods
    
    private func setup() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        setupScrollView()
    }
    
    private func setupScrollView() {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .clear
        scrollView.bounces = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
            contentStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
