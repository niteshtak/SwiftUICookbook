//
//  CalendarView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/8/23.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    @State private var date = Date()

    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



