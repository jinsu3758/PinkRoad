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
    @IBOutlet weak var selectedStationBarView: UIView!
    @IBOutlet weak var selectedStationLabel: UILabel!
    
    var selectedView: SelectView = SelectView(frame: CGRect.init())
    var routeList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.zoomScale = 1.5
        selectedView.delegate = self
        stationCollectionView.delegate = self
        stationCollectionView.dataSource = self
        
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
                // x는 삼각지 x좌표 - 120 , y는 삼각지 y좌표 + 5
                routeList = ["4", "6"]
                stationCollectionView.reloadData()
                selectedStationView.isHidden = false
                selectedStationBarView.backgroundColor = .fourStationColor
                selectedStationLabel.bezierPathBorder(.fourStationColor, width: 5)
                scrollView.setContentOffset(CGPoint(x: 406, y: 350 - 60), animated: true)
                selectedView.frame = CGRect(x: 406 - 120, y: 360, width: 196.5, height: 86)
                self.mapView.addSubview(selectedView)
                selectedView.isHidden = false
                
            }
            else if (point.x >= 392 && point.x <= 408) && (point.y >= 138 && point.y <= 150) {
                print("안국!!")
                routeList = ["3"]
                stationCollectionView.reloadData()
                selectedStationView.isHidden = false
                selectedStationBarView.backgroundColor = .threeStationColor
                selectedStationLabel.bezierPathBorder(.threeStationColor, width: 5)
                scrollView.setContentOffset(CGPoint(x: 390, y: 130 - 60), animated: true)
                selectedView.frame = CGRect(x: 392 - 120, y: 150, width: 196.5, height: 86)
                self.mapView.addSubview(selectedView)
                selectedView.isHidden = false
            }
            else {
                selectedView.isHidden = true
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
        selectedView.isHidden = true
    }
    
    func selectVia() {
        
    }
    
    func selectArrive() {
        performSegue(withIdentifier: "reserve", sender: self)
    }
    
    func selectTimeTable() {
        
    }
}

extension SubwayMapViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeCell", for: indexPath) as! SelectedStationCell
        cell.fill(routeList[indexPath.item])
        return cell
    }
    
    
}


