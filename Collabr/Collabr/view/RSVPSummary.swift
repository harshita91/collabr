//
//  RSVPSummary.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/18/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import UIKit

class RSVPSummary: UIView {
	
	let nibName = "RSVPSummaryView"
	
	@IBOutlet weak var goingLabel: UILabel!
	@IBOutlet weak var maybeLabel: UILabel!
	@IBOutlet weak var notGoingLabel: UILabel!
	
	var contentView:UIView?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
	
	func setRSVPData(event: Event){
		goingLabel.text = "\(EventManager.getNumOfInvitees(for: event, .GOING))"
		maybeLabel.text = "\(EventManager.getNumOfInvitees(for: event, .MAYBE))"
		notGoingLabel.text = "\(EventManager.getNumOfInvitees(for: event, .NOT_GOING))"
	}
}
