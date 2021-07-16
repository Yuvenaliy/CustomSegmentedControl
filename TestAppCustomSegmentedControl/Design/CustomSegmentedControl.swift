//
//  CustomSegmentedControl.swift
//  TestAppCustomSegmentedControl
//
//  Created by Ювеналий on 15.07.2021.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func change(to index:Int)
}

class CustomSegmentedControl: UIView {
    
    private var buttons: [UIButton]!
    private var buttonTitles: [String]!
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = #colorLiteral(red: 1, green: 0.8823529412, blue: 0.5294117647, alpha: 1)
    
    public private(set) var selectedSegmentIndex : Int = 0
    weak var delegate: CustomSegmentedControlDelegate?

    private func createButtons() {
        buttons = [UIButton]()
        buttons.removeAll()
        for i in 0..<buttonTitles.count {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitles[i], for: .normal)
            button.tag = i
            button.setTitleColor(textColor, for: .normal)
           
            button.titleLabel!.minimumScaleFactor = 0.1
            button.titleLabel?.numberOfLines = 2
            button.titleLabel?.textAlignment = .center
            button.addTarget(self, action: #selector(buttonIsActive(sender:)), for: .touchUpInside)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 0.1
            
            buttons.append(button)
            
        }
        buttons[0].backgroundColor = selectorViewColor
        
    }
    
    @objc private func buttonIsActive(sender: UIButton){
        for i in 0..<buttons.count {
            buttons[i].backgroundColor = .none
        }
        sender.backgroundColor = selectorViewColor
        selectedSegmentIndex = sender.tag
        delegate?.change(to: selectedSegmentIndex)
    }
    
    
    private func createStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = CGFloat(4.0)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
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



