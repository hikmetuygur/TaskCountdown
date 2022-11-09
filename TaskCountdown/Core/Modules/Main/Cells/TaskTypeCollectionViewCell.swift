//
//  TaskTypeCollectionViewCell.swift
//  TaskCountdown
//
//  Created by huygur on 9.11.2022.
//

import UIKit

class TaskTypeCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Outlets
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeName: UILabel!
    
    
    //MARK: - Variables

    
    //MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.height / 2
        }
        
    }
    
    //MARK: - Functions

    override class func description() -> String {
        return "TaskTypeCollectionViewCell"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
        self.imageView.image = nil
    }
    
    func setupCell(taskType: TaskType, isSelected: Bool) {
        self.typeName.text = taskType.typeName
        
        if isSelected {
            self.imageContainerView.backgroundColor = UIColor(hexString: "#FF731D").withAlphaComponent(0.5)
            self.typeName.textColor = UIColor(hexString: "#F8EDE3")
            self.imageView.tintColor = UIColor(hexString: "#F8EDE3")
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: .medium))
        } else {
            
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))
            reset()
        }
    }
    
    func reset(){
        self.imageContainerView.backgroundColor = UIColor.clear
        self.typeName.textColor = UIColor(hexString: "#142850")
        self.imageView.tintColor = UIColor(hexString: "#142850")
    }

}

//MARK: - Extensions

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
