//
//  UIView+Extension.swift
//  CodeLibrary
//
//  Created by ShaoHuan Tang on 2023/4/16.
//

import UIKit

extension UIView {
    
    func loadViewFromNib()  {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    // MARK: - Constraint
    func constraintEqualToSuperView() {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
    }
}
