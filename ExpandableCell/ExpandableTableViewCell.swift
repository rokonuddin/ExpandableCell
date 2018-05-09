//
//  ExpandableTableViewCell.swift
//  ExpandableCell
//
//  Created by Rokon Uddin on 5/9/18.
//  Copyright © 2018 Rokon Uddin. All rights reserved.
//

import UIKit

protocol ExpandableTableViewCellDelegate: class {
    func expandButtonPassedOnCell(_ cell: ExpandableTableViewCell)
}

class ExpandableTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    weak var delegate: ExpandableTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindModel(_ mode: CellModel)  {
        titleLabel.text = mode.title
        detailLabel.text = mode.isExpanded ? mode.detail : ""
        arrowButton.tag = Int(truncating: NSNumber(booleanLiteral: mode.isExpanded))
        if mode.isExpanded {
            arrowButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
    }

    @IBAction func expandButtonPressed(_ sender: UIButton) {
        self.delegate?.expandButtonPassedOnCell(self)
        
        UIView.animate(withDuration: 0.3) { [sender]
            let angle = (sender.tag == 0) ? Double.pi/2 : -Double.pi/2
            sender.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
        self.arrowButton.transform = CGAffineTransform.identity
    }
}
