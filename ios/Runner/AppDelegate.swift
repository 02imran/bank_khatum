import UIKit
import Flutter
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyA5CwqWWemijUqL6sg6wvwve6sAigEGVY8")
    GeneratedPluginRegistrant.register(with: self)

//    ............... new ........................
//     FirebaseApp.configure()
    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )
    } else {
      let settings: UIUserNotificationSettings =
        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }
    application.registerForRemoteNotifications()

    // Register with APNs
//    UIApplication.shared.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let firebaseAuth = Auth.auth()
            firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)

        }
    override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            let firebaseAuth = Auth.auth()
            if (firebaseAuth.canHandleNotification(userInfo)){
                print(userInfo)
                return
            }

        }
}
