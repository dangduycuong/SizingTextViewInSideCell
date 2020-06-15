//
//  DetailCell.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//
//Delegate
import UIKit

protocol DetailCellDelegate: class {
    func passData(text: String, indexPath: IndexPath)
}

class DetailCell: BaseTableViewCell, UITextViewDelegate {

    @IBOutlet weak var detailTextView: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if let delegate = delegate as? DetailCellDelegate, let indexPath = indexPath {
            delegate.passData(text: detailTextView.text, indexPath: indexPath)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate as? DetailCellDelegate, let indexPath = indexPath {
            delegate.passData(text: detailTextView.text, indexPath: indexPath)
        }
    }
    
    //Ẩn textView
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
