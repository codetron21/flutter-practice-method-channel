import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

        let serialChannel = FlutterMethodChannel(name: "com.codetron/serial",
                                                 binaryMessenger: controller.binaryMessenger)
        
        serialChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            guard call.method == "getDevSerial" else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            result(UIDevice.current.identifierForVendor?.uuidString)
        })
        
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
