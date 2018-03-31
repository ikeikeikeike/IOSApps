//
//  InputTextTableViewCell.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/29.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

protocol InputTextTableCellDelegate {
    func textFieldDidEndEditing(cell: InputTextTableViewCell, value: String) -> ()
}

class InputTextTableViewCell: UITableViewCell, UITextFieldDelegate {
    var delegate: InputTextTableCellDelegate! = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    internal func textFieldDidEndEditing(textField: UITextField) {
        delegate.textFieldDidEndEditing(cell: self, value: textField.text!)
    }
}
