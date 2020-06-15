//
//  DetailVC.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailCellDelegate {
    func passData(text: String, indexPath: IndexPath) {
        listNote[indexPath.row] = text
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listNote = ["Also, don’t forget to turn off the Scrolling Enabled property in the property inspector of UITextView. This allows UITextView to have an intrinsic content size depending on the text, or close to the text size as we later found out.", "Note: Don’t forget to make tableView weak in this closure’s capture list because you will end up with a retain cycle. tableView -> cell (UI), cell -> tableView (closure)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(DetailCell.nib(), forCellReuseIdentifier: DetailCell.identifier())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier(), for: indexPath) as! DetailCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.detailTextView.text = listNote[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Storyboard.QuanLyHaTangNIMS.showDetailVC()
        vc.text = listNote[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
