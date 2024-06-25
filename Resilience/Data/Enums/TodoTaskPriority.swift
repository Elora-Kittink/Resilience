//
//  TodoTaskPriority.swift
//  Resilience
//
//  Created by Elora on 18/06/2024.
//

import Foundation
import SwiftUI

enum TodoTaskPriority: String, CaseIterable {
	case normal = "Normal"
	case medium = "Medium"
	case high = "High"
	
	var color: Color {
		switch self {
		case .normal:
				.green
			
		case .medium:
				.yellow
			
		case .high:
				.red
		}
	}
	
	var sortedOrder: Int {
		switch self {
		case .normal: 0
		case .medium: 1
		case .high: 2
		}
	}
}
