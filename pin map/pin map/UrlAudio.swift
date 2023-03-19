import SwiftUI
import AVFoundation



func loadUrlAudio(_ urlString:String) -> AVAudioPlayer? {
    let url = URL(string: urlString)
    do {
        let data = try Data(contentsOf: url!)
        return try AVAudioPlayer(data: data)
    } catch {
        print("loadUrlSound error", error)
    }
    return nil
}

let urlSounds = [
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3",
    "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3",
]

let imageArray = [
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/d70f6dc1c97191b06d091d11f2eb7444-384.jpg",
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/1c22ce280d7299918461d041a454bea6-384.jpg",
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/c4e6162ea5f06778552179b53edb4cca-384.jpg",
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/25f33c6f4a66b3fe05514744af10785e-384.jpg",
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/5e801a7f24fd69dbed80491a6e641696-384.jpeg",
    "https://cdn.epidemicsound.com/player/20230221.22-deacc8ab30e1c6ed5ea79ea5566154d9efdb69b6/bcfe69b24690535b14280dcd0ae26f1d-384.jpg",
]



    struct Page3: View {
        @State private var soundIndex = 0
        @State private var soundFile = urlSounds[0]
        @State private var player: AVAudioPlayer? = nil
        var body: some View {
            TimelineView(.animation) { context in
                VStack {
                    HStack {
                        Button(action:{
                            print("Button Play")
                            player = loadUrlAudio(soundFile)
                            print("player", player as Any)
                            // Loop indefinitely
                            player?.numberOfLoops = -1
                            player?.play()
                        })
                        {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                        Button(action: {
                            print("Button Stop")
                            player?.stop()
                        })
                        {
                            Image(systemName: "pause.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                    }
                        Button(action: {
                            soundIndex = (soundIndex+1) % urlSounds.count
                            soundFile = urlSounds[soundIndex]
                        })
                        {
                            Image(systemName: "forward.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                    }
                        
                    }
                    Text("soundIndex \(soundIndex)")
                    //Text(soundFile)
                    if let player = player {
                        Text("duration " + String(format: "%.1f", player.duration))
                        Text("currentTime " + String(format: "%.1f", player.currentTime))
                    }
                }
            }
        }
    }

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}


// Source for audio clips
// https://www.youraccompanist.com/free-scales-and-warm-ups/reference-scales
// Reference Scales_On A Flat-G Sharp.mp3
// https://sound-effects.bbcrewind.co.uk/search?cat=Animals

