//
//  HighlighterView.swift
//  NoteShare
//
//  Created by Tushar Sachde on 12/11/15.
//  Copyright © 2015 Tushar Sachde. All rights reserved.
//

import UIKit


class HighlighterView: UIView {
    
    @IBOutlet weak var color1: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "HighlighterView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(view);
        
        color1.backgroundColor = UIColor.redColor();
    }
    
    

}
