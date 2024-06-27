//
//  BloomingChart.swift
//  Resilience
//
//  Created by Elora on 25/06/2024.
//

import Foundation
import SwiftUI
import Charts

struct BloomingChart: View {
	var plants: [Plant] = MockDatas.plants
	
	var body: some View {
		let bloomingPeriods = plants.flatMap { $0.bloomingPeriods ?? [] }
		let angles = calculateMonthAngles()
		
		ZStack {
			Chart {
				ForEach(1...365, id: \.self) { day in
					
					// Vérifie si le jour actuel est dans une période de floraison
					let isBlooming = bloomingPeriods.contains { period in
						let startDay = dayOfYear(from: period.start)
						let endDay = dayOfYear(from: period.end)
						return day >= startDay && day <= endDay
					}
					
					// Crée un segment pour chaque jour de l'année
					SectorMark(
						angle: .value("Day", 1),
						innerRadius: .ratio(0.5),
						outerRadius: .ratio(1.0)
					)
					.foregroundStyle(isBlooming ? Color.pink.opacity(0.5) : Color.gray.opacity(0.2))
				}
			}
			.aspectRatio(1, contentMode: .fit)
		}
		.overlay(
			GeometryReader { geo in
				let circleRadius = min(geo.size.width, geo.size.height) / 2
				let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
				
				ForEach(0..<12, id: \.self) { month in
					let startAngle = angles[month].start
					let endAngle = angles[month].end
					
					// Calcul des coordonnées des lignes délimitant les mois
					let startPoint = CGPoint(x: center.x + Foundation.cos(startAngle.radians) * circleRadius,
											 y: center.y + sin(startAngle.radians) * circleRadius)
					let endPoint = CGPoint(x: center.x + Foundation.cos(endAngle.radians) * circleRadius,
										   y: center.y + sin(endAngle.radians) * circleRadius)
					
					// Dessine les lignes délimitant chaque mois
					Path { path in
						path.move(to: center)
						path.addLine(to: startPoint)
					}
					.stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
					
					// Affiche les noms des mois
					let labelAngle = startAngle + Angle(degrees: 15.0)
					let marge: CGFloat = 0.3
					let xOffset = cos(labelAngle.radians) * (circleRadius * marge)
					let yOffset = sin(labelAngle.radians) * (circleRadius * marge)
					
					Text(name(ofMonth: month + 1))
						.font(.footnote)
						.rotationEffect((startAngle + endAngle) / 2)
						.position(x: center.x + xOffset,
								  y: center.y + yOffset)
				}
			}
		)
	}
	
	private func dayOfYear(from date: Date?) -> Int {
		guard let date = date else { return 0 }
		let calendar = Calendar.current
		return calendar.ordinality(of: .day, in: .year, for: date) ?? 1
	}
	
	func name(ofMonth month: Int) -> String {
		let df = DateFormatter()
		df.dateFormat = "MMM"
		if let date = Calendar.current.date(bySetting: .month, value: month, of: .now) {
			return df.string(from: date)
		} else {
			return "Error"
		}
	}
	
	func daysOfMonth(ofMonth month: Int) -> Int {
		let calendar = Calendar.current
		
		guard let date = Calendar.current.date(bySetting: .month, value: month, of: .now),
			  let range = calendar.range(of: .day, in: .month, for: date) else {
			return 0
		}
		return range.count
	}
	
	func calculateMonthAngles() -> [(start: Angle, end: Angle)] {
		let totalDays = (0..<12).map { daysOfMonth(ofMonth: $0 + 1) }.reduce(0, +)
		var angles: [(start: Angle, end: Angle)] = []
		var startDayOfYear: Double = 0
		
		for month in 0..<12 {
			let monthDays = Double(daysOfMonth(ofMonth: month + 1))
			let startAngle = Angle(degrees: (startDayOfYear / Double(totalDays)) * 360.0 - 90.0)
			startDayOfYear += monthDays
			let endAngle = Angle(degrees: (startDayOfYear / Double(totalDays)) * 360.0 - 90.0)
			angles.append((start: startAngle, end: endAngle))
			print("\(month) = \(startAngle.degrees - endAngle.degrees)")
		}
		return angles
	}
}
#Preview("BloomingChart") {
	BloomingChart()
}
