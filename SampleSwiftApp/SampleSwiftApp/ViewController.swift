//
//  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
//  All rights reserved.
//


import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    func sampleFetch (urlPath: String) {
        let request = NSMutableURLRequest(URL: NSURL(string: urlPath)!)
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let tpSessionConfig = TwinPrimeSDK.sessionConfigurationWithConfiguration(sessionConfig)
        let session = NSURLSession(configuration: tpSessionConfig)

        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                print(error)
            } else {
                let result = NSString(data: data!, encoding: NSASCIIStringEncoding)!
                print(result)
            }
        }
        task.resume()
    }


    var data = NSMutableData()

    // Following function uses NSURLConnection
    func sampleOldFetch (urlPath: String) {
        // Do any additional setup after loading the view, typically from a nib.
        let url: NSURL = NSURL(string: urlPath)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        connection.start()
    }
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }

    func connectionDidFinishLoading(connection: NSURLConnection!) {
        print("---------------");
        print(data)
        print("---------------")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Twin Prime SDK Sample Swift App be default shows NSURLSession
        // example. Change this variable to 'false' to see NSURLConnection
        // example.
        let wantToUseTPSDKwithNSURLSession = true

        if (wantToUseTPSDKwithNSURLSession) {
            sampleFetch("http://httpbin.org/get")
        } else {
            sampleOldFetch("http://httpbin.org/get")
        }
    }

}
