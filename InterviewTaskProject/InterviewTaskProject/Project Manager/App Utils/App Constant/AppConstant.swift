//
//  AppConstant.swift
//  InterviewTaskProject
//
//  Created by Mac Mini on 14/06/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView

//#MARK:- APP INFORMATIONS
let APP_Title = "Interview Task Project"

//#MARK:- SCREEN-SIZES
let SCREEN = UIScreen.main.bounds
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//#MARK:- App Window
let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

//#MARK:- APP-STORYBOARD CONSTANTS
enum AppStoryboard : String {
    
    case main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

//#MARK:- APP-LOADER
let sLoaderView = NVActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), type: NVActivityIndicatorType.circleStrokeSpin, color: .black, padding: SCREEN_WIDTH/2.2)
