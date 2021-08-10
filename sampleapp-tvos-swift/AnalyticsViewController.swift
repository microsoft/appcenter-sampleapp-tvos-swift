
import UIKit
import AppCenterAnalytics

class AnalyticsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendCustomEvent(_ sender: Any) {
        Analytics.trackEvent("Sample event")
        print("send a custom alert via Cocoapods")
        presentCustomEventAlert()
    }


    @IBAction func sendEventWithProperty(_ sender: Any) {
        print("custom color property button pressed")
        presentColorPropertyAlert()
    }

    // - MARK: Alert Functions

    func presentCustomEventAlert() {
        let alert = UIAlertController(title: "Event sent",
                                      message: "",
                                      preferredStyle: .alert)

        // OK Button
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }

    func presentColorPropertyAlert() {
        let alert = UIAlertController(title: "Choose a color",
                                      message: "",
                                      preferredStyle: .alert)
        alert.view.tintColor = UIColor.white

        // Yellow button
        alert.addAction(UIAlertAction(title: "💛 Yellow",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        Analytics.trackEvent("Color event", withProperties: ["Color": "Yellow"])
        }))

        // Blue button
        alert.addAction(UIAlertAction(title: "💙 Blue",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        Analytics.trackEvent("Color event", withProperties: ["Color": "Blue"])
        }))

        // Red button
        alert.addAction(UIAlertAction(title: "❤️ Red",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        Analytics.trackEvent("Color event", withProperties: ["Color": "Red"])
        }))

        present(alert, animated: true, completion: nil)
    }

}
