//
//  EventSummaryTableViewCell.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/4/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import UIKit

class EventSummaryCell: UITableViewCell {

	@IBOutlet weak var eventTimeLabel: UILabel!
	@IBOutlet weak var eventTitleLabel: UILabel!
	@IBOutlet weak var eventGoingCountLabel: UILabel!
	@IBOutlet weak var eventMaybeCountLabel: UILabel!
	@IBOutlet weak var eventNotGoingCountLabel: UILabel!
	@IBOutlet weak var eventCardView: UIView!

	@IBOutlet weak var rsvpSummaryView: RSVPSummary!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		eventCardView.layer.cornerRadius = eventCardView.frame.size.height/10
		eventCardView.layer.borderWidth = 1
		eventCardView.layer.borderColor = UIColor.borderColor.cgColor
		eventCardView.layer.backgroundColor = UIColor.bgColorSecondary.cgColor
		
		self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
		if(selected){
			eventCardView.layer.backgroundColor = UIColor.bgColorSecondarySelected?.cgColor
		} else {
			eventCardView.layer.backgroundColor = UIColor.bgColorSecondary.cgColor
		}
    }
    
}
