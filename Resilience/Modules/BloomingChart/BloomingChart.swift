//
//  BloomingChart.swift
//  Resilience
//
//  Created by Elora on 25/06/2024.
//

import Foundation
import SwiftUI

struct BloomingChart: View {
	var body: some View {
		ZStack {
			ForEach(0..<360, id: \.self) { degree in
				SegmentChart(degree: degree)
			}
		}
		.aspectRatio(1, contentMode: .fit)
	}
}

struct SegmentChart: View {
	let degree: Int
	let plants = MockDatas.plants
	
	var body: some View {
		GeometryReader { geometry in
			Path { path in
				let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
				let radius = min(geometry.size.width, geometry.size.height) / 2
				let innerRadius = radius * 0.7
				let startAngle = Angle(degrees: Double(degree))
				let endAngle = Angle(degrees: Double(degree + 1))
				
				path.move(to: CGPoint(x: center.x + innerRadius * Foundation.cos(startAngle.radians), 
									  y: center.y + innerRadius * sin(startAngle.radians)))
				path.addLine(to: CGPoint(x: center.x + radius * Foundation.cos(startAngle.radians), 
										 y: center.y + radius * sin(startAngle.radians)))
				path.addArc(center: center, 
							radius: radius,
							startAngle: startAngle,
							endAngle: endAngle, 
							clockwise: false)
				path.addLine(to: CGPoint(x: center.x + innerRadius * Foundation.cos(endAngle.radians), 
										 y: center.y + innerRadius * sin(endAngle.radians)))
				path.addArc(center: center, 
							radius: innerRadius,
							startAngle: endAngle,
							endAngle: startAngle, 
							clockwise: true)
			}
			.fill(isAnyPlantBlooming(in: degree) ? Color.green : Color.gray)
		}
	}
	
	func isAnyPlantBlooming(in degree: Int) -> Bool {
		let dayOfYear = degree
		let calendar = Calendar.current
		
		return plants.contains { plant in
			guard let bloomingStart = plant.bloomingStart, let bloomingEnd = plant.bloomingEnd else { return false }
			let startDay = calendar.ordinality(of: .day, in: .year, for: bloomingStart) ?? 0
			let endDay = calendar.ordinality(of: .day, in: .year, for: bloomingEnd) ?? 0
			return startDay <= dayOfYear && dayOfYear <= endDay
		}
	}
}

#Preview {
	BloomingChart()
}
