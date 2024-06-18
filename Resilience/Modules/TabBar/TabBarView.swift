//  TabBarViewController.swift
//
//  Created by Elora on 17/06/2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
	var body: some View {
		TabView {
			DashboardView()
				.tabItem {
					Label("Dashboard", systemImage: "list.dash.header.rectangle")
				}
			GardenView(viewModel: GardenViewModel())
				.tabItem {
					Label("Garden", systemImage: "tree")
				}
			HouseView()
				.tabItem {
					Label("House", systemImage: "house.lodge")
				}
		}
	}
}











#Preview {
	TabBarView()
}
