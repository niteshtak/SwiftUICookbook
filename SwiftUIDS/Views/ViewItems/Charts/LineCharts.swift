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
    
    let values: [Int]
    let labels: [String]
    
    let screenWidth = UIScreen.main.bounds.width
    
    private var path: Path {
        if values.isEmpty {
            return Path()
        }
        
        var offsetX: Int = Int(screenWidth/CGFloat(values.count))
        var path = Path()
        path.move(to: CGPoint(x: offsetX, y: values[0]))
        
        for value in values {
            offsetX += Int(screenWidth/CGFloat(values.count))
            path.addLine(to: CGPoint(x: offsetX, y: value))
        }
        
        return path
    }
    
    var body: some View {
        VStack {
            path.stroke(Color.white, lineWidth: 2.0)
        }
    }
}


struct ChartView: View {
    
    let values = generateChartData().map { Int($0.value) }
    let chartLabels = generateYearlyData()
    
    var body: some View {
        VStack {
            LineChartView(values: values, labels: chartLabels)
        }
        .background(Color.green)
    }
}
