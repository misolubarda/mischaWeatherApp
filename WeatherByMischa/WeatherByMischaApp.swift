//

import SwiftUI

@main
struct WeatherByMischaApp: App {
    @State var text: String = "Some text"

    var body: some Scene {
        WindowGroup {
            MainCoordinatorView()
        }
    }
}
