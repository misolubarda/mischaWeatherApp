//

import SwiftUI

struct MainCoordinatorView: View {
    var body: some View {
        NavigationStack {
            CurrentWeatherView()
        }
    }
}

#Preview {
    MainCoordinatorView()
}
