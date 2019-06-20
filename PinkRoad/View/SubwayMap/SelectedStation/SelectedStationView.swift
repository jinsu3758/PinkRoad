//
//  SelectedStationView.swift
//  PinkRoad
//
//  Created by 박진수 on 20/06/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit

protocol SelectDelegate {
    func selectStart()
    func selectVia()
    func selectArrive()
    func selectTimeTable()
}

class SelectView: UIView {
    var delegate: SelectdDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        let view = Bundle.main.loadNibNamed("SelectedStationView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    @IBAction func selectStart(_ sender: Any) {
        delegate?.selectStart()
    }
    @IBAction func selectVia(_ sender: Any) {
        delegate?.selectVia()
    }
    @IBAction func selectArrive(_ sender: Any) {
        delegate?.selectArrive()
    }
    @IBAction func selectTimeTable(_ sender: Any) {
        delegate?.selectTimeTable()
    }
    
    
}
