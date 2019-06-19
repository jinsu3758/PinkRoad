//
//  SubwayMapViewController.swift
//  PinkRoad
//
//  Created by 박진수 on 19/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

class SubwayMapViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }

}

extension SubwayMapViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapView
    }
}
