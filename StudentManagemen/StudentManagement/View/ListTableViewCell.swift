//
//  ListTableViewCell.swift
//  StudentManagement
//
//  Created by E5000861 on 07/06/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    private var identifier = "cell"
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var studentName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
