//
//  InputTextTableViewCell.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/29.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

protocol InputTextTableViewCellDelegate {
    func textFieldDidEndEditing(cell: InputTextTableViewCell, textField: UITextField) -> ()
}

class InputTextTableViewCell: UITableViewCell, UITextFieldDelegate {
    var delegate: InputTextTableViewCellDelegate! = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    internal func textFieldDidEndEditing(_ textField: UITextField) {
        delegate.textFieldDidEndEditing(cell: self, textField: textField)
    }
}
