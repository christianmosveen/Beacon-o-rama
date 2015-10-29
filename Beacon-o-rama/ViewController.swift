import UIKit

class ViewController: UIViewController, ESTBeaconManagerDelegate {
    
    let colors = [
        1: UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1),
        2: UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1),
        3: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    ]

    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Free-ranged beacons and eggs")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            let proximity = nearestBeacon.proximity.rawValue
            self.view.backgroundColor = self.colors[proximity]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

