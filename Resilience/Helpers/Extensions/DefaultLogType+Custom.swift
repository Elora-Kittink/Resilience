//
//  DefaultLogType+Custom.swift
//  Resilience
//
//  Created by Thibaud Lambert on 14/03/2023.
//  Copyright © 2023 Exomind. All rights reserved.
//

import Foundation
import UtilsKit

extension DefaultLogType {
	
	static let `deinit`: DefaultLogType = .custom("💀")
	static let firebase: DefaultLogType = .custom("🧯")
	static let analytics: DefaultLogType = .custom("📊")
}
