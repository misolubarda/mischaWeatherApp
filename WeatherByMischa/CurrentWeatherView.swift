//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var viewModel = CurrentWeatherViewModel()

    var body: some View {
        VStack {
            Text("Odessa")
                .font(.title)
            Spacer()
                .frame(maxHeight: 10)
            Text("Temperature: \(viewModel.temperatureString)")
                .onAppear(perform: {
                    viewModel.onAppear()
                })
                .font(.body)
            Text("Humidity: \(viewModel.humidityString)")
            Text("Cloudiness: \(viewModel.cloudinessString)")
            Spacer()
                .frame(maxHeight: 100)
            Button("Refresh", action: {
                viewModel.buttonTapped()
            })
        }
    }
}

#Preview {
    CurrentWeatherView()
}
