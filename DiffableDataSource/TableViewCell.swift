//
//  TableViewCell.swift
//  DiffableDataSource
//
//  Created by ankit bharti on 06/10/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var detail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(from contact: Contact) {
        title?.text = contact.name
        detail?.text = contact.email
    }
}
