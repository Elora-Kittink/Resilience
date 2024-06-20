//
//  BaseView.swift
//  Resilience
//
//  Created by Thibaud Lambert on 18/08/2022.
//  Copyright © 2022 Exomind. All rights reserved.
//

import Foundation
import UIKit
import UtilsKit

class BaseView: UIView {
	
	// MARK: - Init
	deinit {
		log(.deinit, "Deinit \(String(describing: self))")
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.localize()
	}
}
