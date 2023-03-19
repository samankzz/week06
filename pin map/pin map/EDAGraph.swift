/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI
import Foundation
import Charts


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct MonthlyHoursOfSunshine:Identifiable {
    var date: Date
    var hoursOfSunshine: Double
    let id = UUID()

    init(month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
    }
}

var data: [MonthlyHoursOfSunshine] = [
    MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
    MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 79),
    MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 209),
    // ...
    MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)
]




struct EDAGraph: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sunshine", $0.hoursOfSunshine)
            )
        }
    }

}



struct EDAGraph_Previews: PreviewProvider {
    static var previews: some View {
        EDAGraph()
        }
    }


