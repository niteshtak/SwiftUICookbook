//
//  LineCharts.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 5/12/21.
//

import SwiftUI

struct ChartData {
    let value: Double
}

private func generateChartData() -> [ChartData] {
    var chartData: [ChartData] = []
    
    for _ in 1...20 {
        let data = ChartData(value: Double.random(in: 100...300))
        chartData.append(data)
    }
    
    return chartData
}

private func generateYearlyData() -> [String] {
    return (2016...2021).map { String($0) }
}

struct LineChartView: View {
    var body: some View {
        VStack {
            
        }
    }
}


struct ChartView: View {
    
    let values = generateChartData().map { $0.value }
    let chartLabels = generateYearlyData()
    
    var body: some View {
        VStack {
            
        }
    }
}
