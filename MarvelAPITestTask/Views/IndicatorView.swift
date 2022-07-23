//
//  IndicatorView.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 23.07.2022.
//

import UIKit

class IndicatorView: UIView {
    
    var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = Const.Corner.bigRadius.rawValue
        backgroundColor = .white.withAlphaComponent(Const.Alpha.indicator.rawValue)
        addSubview(indicator)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        indicator.startAnimating()
        isHidden = false
    }

    public func hide() {
        isHidden = true
        indicator.stopAnimating()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Const.ImageSize.indicator.rawValue),
            widthAnchor.constraint(equalToConstant: Const.ImageSize.indicator.rawValue),
            
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
