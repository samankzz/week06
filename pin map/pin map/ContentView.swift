/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Activity", systemImage: "figure.run")
                }

            MapView()
                .tabItem {
                    Label("Course", systemImage: "map")
                }
            
            Page3()
                .tabItem {
                    Label("Music", systemImage: "music.note.house.fill")
                }
            
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            
            EDADetail()
                .tabItem {
                    Label("Signal", systemImage: "waveform.path.ecg.rectangle.fill")
                }
            
        
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
