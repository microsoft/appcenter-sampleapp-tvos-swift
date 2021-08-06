
import UIKit
import AppCenterCrashes

class CrashesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendSampleCrash(_ sender: Any) {
        presentCrashAlert()
    }

    // - MARK: Alert Functions
    func presentCrashAlert() {
        let alert = UIAlertController(title: "The app will close",
                                      message: "A crash report will be sent when you reopen the app.",
                                      preferredStyle: UIAlertController.Style.alert)

        // Cancel Button
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        // Crash App button
        alert.addAction(UIAlertAction(title: "Crash app",
                                      style: UIAlertAction.Style.destructive,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        // generate test crash
                                        Crashes.generateTestCrash()
                                        fatalError()
        }))

        present(alert, animated: true, completion: nil)
    }

}
