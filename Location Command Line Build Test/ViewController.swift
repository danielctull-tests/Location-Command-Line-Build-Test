
import CoreLocation
import UIKit

class ViewController: UIViewController {

	private let locationManager = CLLocationManager()

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		locationManager.delegate = self
		locationManager.startUpdatingLocation()
	}

	@IBOutlet private var latitudeLabel: UILabel? { didSet { updateLabels() }}
	@IBOutlet private var longitudeLabel: UILabel? { didSet { updateLabels() }}
	fileprivate var location: CLLocation? { didSet { updateLabels() } }

	private func updateLabels() {

		guard
			let latitudeLabel = latitudeLabel,
			let longitudeLabel = longitudeLabel,
			let location = location
		else {
			self.latitudeLabel?.text = ""
			self.longitudeLabel?.text = ""
			return
		}

		latitudeLabel.text = String(location.coordinate.latitude)
		longitudeLabel.text = String(location.coordinate.longitude)
	}
}



extension ViewController: CLLocationManagerDelegate {

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

		location = locations.last
	}
}
