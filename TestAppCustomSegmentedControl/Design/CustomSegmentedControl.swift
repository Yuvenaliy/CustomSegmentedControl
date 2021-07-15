//
//  CustomSegmentedControl.swift
//  TestAppCustomSegmentedControl
//
//  Created by Ювеналий on 15.07.2021.
//

import UIKit

class CustomSegmentedControl: UIView {
    
    private var buttons: [UIButton]!
    private var buttonTitles: [String]!
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = #colorLiteral(red: 0.3803921569, green: 0.8039215686, blue: 0.9137254902, alpha: 1)
    

    private func createButtons() {
        buttons = [UIButton]()
        buttons.removeAll()
        
        for i in 0..<buttonTitles.count {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitles[i], for: .normal)
            button.tag = i
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.layer.cornerRadius = 10
            buttons.append(button)
        }
        buttons[0].backgroundColor = selectorViewColor
    }
    
       
    @objc private func buttonAction(sender: UIButton) {
        for i in 0..<buttons.count {
            buttons[i].backgroundColor = .none
        }
        sender.backgroundColor = selectorViewColor
    }
    
    
    private func createStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.layer.borderWidth = 0.1
        stackView.layer.cornerRadius = 7
    }
    

    private func updateView() {
        createButtons()
        createStackView()
    }
    
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
        updateView()
    }
}
