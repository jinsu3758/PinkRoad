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
    @IBOutlet weak var stationCollectionView: UICollectionView!
    @IBOutlet weak var selectedStationView: UIView!
    @IBOutlet weak var stationLabel: UILabel!
    
    var selectedView: SelectView = SelectView(frame: CGRect.init())
    var routeList: [String] = ["4", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.zoomScale = 1.5
        selectedView.delegate = self
        stationCollectionView.delegate = self
        stationCollectionView.dataSource = self
        stationLabel.bezierPathBorder(.fourStationColor, width: 5)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
        mapView.isUserInteractionEnabled = true
    }
    
    @objc func mapTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let point = sender.location(in: sender.view)
            print("x : \(point.x) y : \(point.y)")
            if (point.x >= 400 && point.x <= 412) && (point.y >= 350 && point.y <= 360) {
                print("삼각지!!")
                // x는 신길 x좌표 - 120 , y는 신길 y좌표 + 5
                scrollView.setContentOffset(CGPoint(x: 406, y: 350 - 60), animated: true)
                selectedView.frame = CGRect(x: 406 - 120, y: 360, width: 196.5, height: 77)
                self.mapView.addSubview(selectedView)
                
            }
        }
    }

}

extension SubwayMapViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapView
    }
}

extension SubwayMapViewController: SelectDelegate {
    func selectStart() {
        
        
    }
    
    func selectVia() {
        
    }
    
    func selectArrive() {
        
    }
    
    func selectTimeTable() {
        
    }
}

extension SubwayMapViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeCell", for: indexPath) as! SelectedStationCell
        let index = indexPath.item
        cell.numLabel.text = routeList[index]
        cell.numLabel.layer.cornerRadius = 12
        cell.numLabel.layer.masksToBounds = true
        if index == 0 {
            cell.numLabel.backgroundColor = .fourStationColor
        }
        else {
            cell.numLabel.backgroundColor = .sixStationColor
        }
        return cell
    }
    
    
}


