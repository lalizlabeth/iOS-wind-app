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
    
    let uuid = "7CDE487F-D2E1-79E0-66C2-0447A8F98B8D"
    var blueToothReady = false
    var centralManager = CBCentralManager() // Defining central
    var peripheralManager = CBPeripheralManager() // Defining peripheral

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Breeze"
    }
    
    // Invoked when you discover the characteristics of a specified service.
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!)
    {
        var myCharacteristic = CBCharacteristic()
        
        for myCharacteristic in service.characteristics {
            
            peripheral.readValueForCharacteristic(myCharacteristic as CBCharacteristic)
            
        }
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
    
    func centralManager(central: CBCentralManager!,
        didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: [NSObject : AnyObject]!,
        RSSI: NSNumber!) {
            
            central.connectPeripheral(peripheral, options: nil)
            
            
            var curDevice = UIDevice.currentDevice()
            
            // Hardware beacon
            println("PERIPHERAL NAME: \(peripheral.name)\n AdvertisementData: \(advertisementData)\n RSSI: \(RSSI)\n")
            
            println("UUID DESCRIPTION: \(uuid)\n")
            
            println("IDENTIFIER: \(peripheral.identifier)\n")
            
            // stop scanning, saves the battery
            centralManager.stopScan()
            
    }

    
    func peripheralManagerDidUpdateState(central: CBPeripheralManager!) {
        switch peripheralManager.state {
            
        case .PoweredOff:
            sensorData.text = "Peripheral - CoreBluetooth BLE hardware is powered off"
            break
            
        case .PoweredOn:
            sensorData.text = "Peripheral - CoreBluetooth BLE hardware is powered on and ready"
            break
            
        case .Resetting:
            sensorData.text = "Peripheral - CoreBluetooth BLE hardware is resetting"
            break
            
        case .Unauthorized:
            sensorData.text = "Peripheral - CoreBluetooth BLE state is unauthorized"
            break
            
        case .Unknown:
            sensorData.text = "Peripheral - CoreBluetooth BLE state is unknown"
            break
            
        case .Unsupported:
            sensorData.text = "Peripheral - CoreBluetooth BLE hardware is unsupported on this platform"
            break
            
        default:
            break
        }
        
    }

    
    func openWindow() {
        discoverDevices()
    }
    
    func discoverDevices() {
        println("discovering devices")
        centralManager.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    @IBOutlet weak var sensorData: UILabel!
    @IBAction func openButton(sender: UIButton) {
        openWindow()
    }
    
    @IBAction func closeButton(sender: UIButton) {
    }
    
    @IBOutlet weak var speed: UILabel!

}