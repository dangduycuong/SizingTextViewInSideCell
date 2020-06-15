//
//  StroryBoard.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

struct Storyboard {
    
}

extension Storyboard {
    struct QuanLyHaTangNIMS {
        static let main = UIStoryboard(name: "Main", bundle: nil)
        
        
        static func showDetailVC() -> ShowDetailVC {
            return main.instantiateViewController(withIdentifier: "ShowDetailVC") as! ShowDetailVC
        }
        
//        static func nimsThemMoiCotVC() -> NimsThemMoiCotVC {
//            return nimsManager.instantiateViewController(withIdentifier: "NimsThemMoiCotVC") as! NimsThemMoiCotVC
//        }
    }
}
