//
//  ReserveViewController.swift
//  PinkRoad
//
//  Created by 박진수 on 21/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class ReserveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = .bgColor
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
