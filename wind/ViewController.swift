//
//  ViewController.swift
//  wind
//
//  Created by Elizabeth Lin on 11/9/14.
//  Copyright (c) 2014 Elizabeth Lin. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    let udid = "7CDE487F-D2E1-79E0-66C2-0447A8F98B8D"
    
    var blueToothReady = false
    
    var centralManager = CBCentralManager()
    var peripheralManager = CBPeripheralManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Breeze"
        
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        
        switch centralManager.state {
            
        case .PoweredOff:
            println("CoreBluetooth BLE hardware is powered off")
            self.speed.text = "CoreBluetooth BLE hardware is powered off\n"
            break
        case .PoweredOn:
            println("CoreBluetooth BLE hardware is powered on and ready")
            self.speed.text = "CoreBluetooth BLE hardware is powered on and ready\n"
            break
        case .Resetting:
            println("CoreBluetooth BLE hardware is resetting")
            self.speed.text = "CoreBluetooth BLE hardware is resetting\n"
            break
        case .Unauthorized:
            println("CoreBluetooth BLE state is unauthorized")
            self.speed.text = "CoreBluetooth BLE state is unauthorized\n"
            
            break
        case .Unknown:
            println("CoreBluetooth BLE state is unknown")
            self.speed.text = "CoreBluetooth BLE state is unknown\n"
            break
        case .Unsupported:
            println("CoreBluetooth BLE hardware is unsupported on this platform")
            self.speed.text = "CoreBluetooth BLE hardware is unsupported on this platform\n"
            break
            
        default:
            break
        }
    }

    
    @IBAction func openButton(sender: UIButton) {
        self.speed.text = "open"
    }
    
    @IBAction func closeButton(sender: UIButton) {
        self.speed.text = "close"
        
    }
    
    @IBOutlet weak var speed: UILabel!

}