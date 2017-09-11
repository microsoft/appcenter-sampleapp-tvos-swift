
import UIKit
import MobileCenterCrashes

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
                                      preferredStyle: UIAlertControllerStyle.alert)

        // Cancel Button
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertActionStyle.default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        // Crash App button
        alert.addAction(UIAlertAction(title: "Crash app",
                                      style: UIAlertActionStyle.destructive,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
                                        // generate test crash
                                        MSCrashes.generateTestCrash()
                                        fatalError()
        }))

        present(alert, animated: true, completion: nil)
    }

}
