//
//  MasterTableViewCell.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//
// cách 1 dùng closure
import UIKit

class MasterTableViewCell: BaseTableViewCell, UITextViewDelegate {

    @IBOutlet weak var masterTextView: UITextView!
    var textChanged: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        masterTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textChanged?(textView.text)
    }
}

//MARK: BaseTableViewCell

class BaseTableViewCell: UITableViewCell {

    weak var delegate: AnyObject?
    var indexPath: IndexPath?
    
    var isEnableLongPressGestureRecognizer: Bool = false
    lazy var longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if isEnableLongPressGestureRecognizer {
            addGestureRecognizer(longPressGestureRecognizer)
        }
        
        self.selectionStyle = .none
    }
    
    func setIndexPath(_ indexPath: IndexPath?, delegate: AnyObject?) {
        self.indexPath = indexPath
        self.delegate = delegate
    }
}

extension BaseTableViewCell {

    @objc class func identifier() -> String {
        return self.nibName()
    }
    
    @objc func setData(_ data: Any?) {
        
    }
}

extension BaseTableViewCell {

    // MARK: - Actions
    @objc func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
    }
}

//MARK: extension UIView
extension UIView {
    
    static func nibName() -> String {
        let nameSpaceClassName = NSStringFromClass(self)
        let className = nameSpaceClassName.components(separatedBy: ".").last! as String
        return className
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName(), bundle: nil)
    }
}
