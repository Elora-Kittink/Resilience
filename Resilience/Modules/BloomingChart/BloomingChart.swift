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
		let bloomingPeriods = plants.compactMap { $0.bloomingPeriod }
		
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
						angle: .value("Day", Double(day)),
						innerRadius: .ratio(0.5),
						outerRadius: .ratio(1.0)
					)
					.foregroundStyle(isBlooming ? Color.pink.opacity(0.5) : Color.gray.opacity(0.3))
				}
			}
			.aspectRatio(1, contentMode: .fit)
			.overlay(
				GeometryReader { geo in
					let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
					ForEach(1...12, id: \.self) { month in
						let startAngle = Angle(degrees: Double(month - 1) / 12.0 * 360.0)
						let endAngle = Angle(degrees: Double(month) / 12.0 * 360.0)
						let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2.0)
						let monthName = DateFormatter().monthSymbols[month - 1]
						
						// Calcul des coordonnées des lignes délimitant les mois
						let x1 = center.x + cos(startAngle.radians) * geo.size.width / 2
						let y1 = center.y + sin(startAngle.radians) * geo.size.height / 2
						
						let x2 = center.x + cos(endAngle.radians) * geo.size.width / 2
						let y2 = center.y + sin(endAngle.radians) * geo.size.height / 2
						
						// Dessine les lignes délimitant chaque mois
						Path { path in
							path.move(to: center)
							path.addLine(to: CGPoint(x: x1, y: y1))
							path.move(to: center)
							path.addLine(to: CGPoint(x: x2, y: y2))
						}
						.stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
						
						// Affiche les noms des mois
						Text(monthName)
							.font(.footnote)
							.rotationEffect(midAngle)
							.position(
								x: center.x + cos(midAngle.radians) * geo.size.width / 6,
								y: center.y + sin(midAngle.radians) * geo.size.height / 6
							)
					}
				}
			)
		}
	}
	
	private func textWidth(_ text: String, font: UIFont) -> CGFloat {
		let attributes: [NSAttributedString.Key: Any] = [.font: font]
		let size = text.size(withAttributes: attributes)
		return size.width
	}
	
	private func dayOfYear(from date: Date?) -> Int {
		guard let date = date else { return 0 }
		let calendar = Calendar.current
		return calendar.ordinality(of: .day, in: .year, for: date) ?? 1
	}
	
	private func monthName(for month: Int) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMMM"
		return formatter.monthSymbols[month - 1]
	}
}

#Preview {
	BloomingChart()
}
