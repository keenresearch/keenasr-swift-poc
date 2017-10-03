//
//  ViewController.swift
//  kr-sap-poc
//
//  Created by Ognjen Todic on 10/1/17.
//  Copyright © 2017 Keen Research. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var recognizedText: UILabel?
  @IBOutlet var startButton: UIButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    // we grab a reference to the recognizer here
    let recognizer = KIOSRecognizer.sharedInstance()
    
    // this class will handle the callbacks
    recognizer?.delegate = self
    
    // we already created this decoding grpah in AppDelegate
    // we could create more than one decoding graph and refer to it by the name
    let decodingGraphName = "digits"
    if KIOSDecodingGraph.decodingGraph(withNameExists: decodingGraphName, for: recognizer!) {
      recognizer?.prepareForListeningWithCustomDecodingGraph(withName: decodingGraphName)
    } else {
      NSLog("Decoding graph %@ does NOT exist. Did you create it in your app?");
    }
    // we setup some of the end silence Voice Activity parameters here
    recognizer?.setVADParameter(KIOSVadParameter.timeoutEndSilenceForAnyMatch, toValue: 1)
    recognizer?.setVADParameter(KIOSVadParameter.timeoutEndSilenceForGoodMatch, toValue: 1)
  }

  @IBAction func startListening(_ sender: UIButton) {
    if KIOSRecognizer.sharedInstance()?.recognizerState != .readyToListen {
      NSLog("Unable to start listening -- recognizer is not ready. Did you call prepareForListeningWithCustomDecodingGraph?");
      return
    }
    
    NSLog("Starting to listeng")
    startButton?.isEnabled = false
    recognizedText?.text = "";
    // we set label text to gray for partial results, then set it to black or red
    // in the finalResult callback based on the confidence score
    recognizedText?.textColor = UIColor.gray
    KIOSRecognizer.sharedInstance()?.startListening()
  }


  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

extension ViewController:KIOSRecognizerDelegate {
  func recognizerPartialResult(_ result: KIOSResult, for recognizer: KIOSRecognizer) {
    NSLog("Partial result: %@", result)
    recognizedText?.text = result.cleanText
  }
  
  func recognizerFinalResult(_ result: KIOSResult, for recognizer: KIOSRecognizer) {
    NSLog("Final result: %@", result)
    startButton?.isEnabled = true
    recognizedText?.text = result.cleanText
    let confidence = result.confidence?.doubleValue
    if (confidence?.isLess(than: 0.75))! {
      // we show "low confidence" result in red
      recognizedText?.textColor = UIColor.red
    } else {
      recognizedText?.textColor = UIColor.black
    }

    // in real app, you may want to check confidence for individual words  (low
    // conf word that are not relevant may not matter, but it will affect the 
    // overall confidence of the result
  }
  
  func unwindAppAudioBeforeAudioInterrupt() {
    NSLog("No need to unwind app audio");
  }
}

