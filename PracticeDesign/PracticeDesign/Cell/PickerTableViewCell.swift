//
//  PickerTableViewCell.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/04/03.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class PickerTableViewCell : UITableViewCell {
    var isObserving = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    class var expandedHeight: CGFloat { get { return 200 } }
    class var defaultHeight: CGFloat  { get { return 44  } }
    
    func checkHeight() {
        datePicker.isHidden = (frame.size.height < PickerTableViewCell.expandedHeight)
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.initial], context: nil)
            isObserving = true;
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false;
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
}
