//
//  EventDetailViewController.swift
//  Collabr
//
//  Created by Harshita Daddala on 5/5/20.
//  Copyright © 2020 CollabrOrg. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
	
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var rsvpSummaryView: RSVPSummary!
	
	var event: Event?
	
	@IBOutlet weak var rsvpRowView: UIView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		loadEventDetails()
	}
    
	@IBAction func dismissBtnPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func loadEventDetails() {
		if let safeEvent = event {
			titleLabel.text = safeEvent.title
			descriptionLabel.text = safeEvent.description
			rsvpSummaryView.setRSVPData(event: safeEvent)
		}
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
