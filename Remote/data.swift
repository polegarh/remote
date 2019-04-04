//
//  data.swift
//  Remote
//
//  Created by oleg on 3/5/19.
//  Copyright © 2019 DePaul University. All rights reserved.
//

import Foundation

class Data {
    static var fav_index = 0
    static var fav_tag = 0
    static var fav_label = ""
    
    func setFavLabel (x : String) {
        Data.fav_label = x
    }
    
    func getFavLabel () -> String {
        return Data.fav_label
    }
    
    func setFavTag (x : Int) {
        Data.fav_tag = x
    }
    
    func getFavTag () -> Int {
        return Data.fav_tag
    }
    
    func setFavIndex (x : Int) {
        Data.fav_index = x
    }
    
    func getFavIndex () -> Int {
        return Data.fav_index
    }
}
