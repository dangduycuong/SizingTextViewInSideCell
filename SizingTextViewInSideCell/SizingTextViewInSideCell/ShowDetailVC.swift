//
//  ShowDetailVC.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class ShowDetailVC: UIViewController {

    @IBOutlet weak var showTextView: UITextView!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let text = text {
            showTextView.text = text
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
