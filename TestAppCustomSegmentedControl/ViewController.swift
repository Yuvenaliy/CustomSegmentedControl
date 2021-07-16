//
//  ViewController.swift
//  TestAppCustomSegmentedControl
//
//  Created by Ювеналий on 15.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let grillTimes = [
        "Rare: 120 to 130 F; 5 then 3 minutes per side; pull off grill at max 125 F",
        "Medium-Rare: 130 to 135 F; 5 then 4 minutes per side; pull off grill at max 130 F",
        "Medium 140 to 150 F; 6 then 4 minutes per side; pull off grill at max 145 F",
        "Medium-Well 155 to 165 F; 7 then 5 minutes per side; pull off grill at max 160 F",
        "Well-Done 170 F or more; 12 then 10 minutes per side; pull off grill at max 165 F",
    ]
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Select Roast!"
        label.font = label.font.withSize(36)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        return label
    }()
    
    let pickerImage: UIImageView = {
        let pickerImage = UIImageView(image: UIImage(named: "knife"))
        pickerImage.contentMode = .scaleAspectFit
        return pickerImage
        
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "steak"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // CustomSegmentedControl
    let customSC = CustomSegmentedControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttonTitles: ["Rare", "Medium Rare", "Medium", "Medium Well", "Well Done"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSC.delegate = self
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8078431373, blue: 0.7764705882, alpha: 1)
        
        descriptionLabel.text = grillTimes[0]
        view.addSubview(label)
        view.addSubview(descriptionLabel)
        view.addSubview(pickerImage)
        view.addSubview(imageView)
        view.addSubview(customSC)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(
            x: 80,
            y: 80,
            width: 215,
            height: 43)
        
        descriptionLabel.frame = CGRect(
            x: 45,
            y: 178,
            width: 286,
            height: 60
        )
        
        pickerImage.frame = CGRect(
            x: 38,
            y: 294,
            width: 77,
            height: 50
        )
        
        imageView.frame = CGRect(
            x: 114,
            y: 307,
            width: 144,
            height: 396
        )
        
        customSC.frame = CGRect(
            x: 16,
            y: 726,
            width: 343,
            height: 50
        )
    }
    
    func imageAnimation() {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        imageView.layer.shadowRadius = 18
        imageView.layer.shadowOpacity = 0.7
        animation.fromValue = imageView.layer.shadowOpacity
        animation.toValue = 0.0
        animation.duration = 5.0
        imageView.layer.add(animation, forKey: animation.keyPath)
        imageView.layer.shadowOpacity = 0.0
    }
}


extension ViewController: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        switch index {
        case 0:
            pickerImage.frame = CGRect(x: 38, y: 294, width: 77, height: 50)
            descriptionLabel.text = grillTimes[0]
            imageAnimation()
        case 1:
            pickerImage.frame = CGRect(x: 38, y: 344, width: 77, height: 50)
            descriptionLabel.text = grillTimes[1]
            imageAnimation()
        case 2:
            pickerImage.frame = CGRect(x: 38, y: 390, width: 77, height: 50)
            descriptionLabel.text = grillTimes[2]
            imageAnimation()
        case 3:
            pickerImage.frame = CGRect(x: 38, y: 431, width: 77, height: 50)
            descriptionLabel.text = grillTimes[3]
            imageAnimation()
        case 4:
            pickerImage.frame = CGRect(x: 38, y: 480, width: 77, height: 50)
            descriptionLabel.text = grillTimes[4]
            imageAnimation()
            
        default:
            print("index not found")
        }
    }
}

