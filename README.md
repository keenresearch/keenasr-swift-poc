**WE ARE HIRING:** https://keenresearch.com/careers.html

## Note

This proof-of-concept app ships with a trial version of KeenASR framework, which will exit (crash) the app 15min after the framework has been initialized. If you would like to obtain a version of the framework without this limitation, contact us at info@keenresearch.com.

By cloning this repository and downloading the trial KeenASR SDK or ASR Bundle you agree to the [KeenASR SDK Trial Licensing Agreement](https://keenresearch.com/keenasr-docs/keenasr-trial-sdk-licensing-agreement.html)

**Important:** 
- You will need [git-lfs](https://git-lfs.github.com/) to checkout the project
- You will need to clone the repository, **Zip download WILL NOT WORK since we use git-lfs for large file management**. After cloning the repository, you will need to **set/change the bundle id** for the app (currently set to com.keenresearch.com.keenasr-ios-poc), as well as **signing settings** in XCode project settings. These settings are under project build settings, General tab->Identity.

## KeenASR Swift Proof-of-Concept App

A proof-of-concept app that shows how to run KeenASR automatic speech recognition framework in a Swift app. For detailed information on all classes and methods, consult the [SDK reference documentation](http://keenresearch.com/keenasr-docs) (Swift documentation coming soon). If starting with the framework from scratch, check our [Quick Start](http://keenresearch.com/keenasr-docs/docs/additional-docs/Quick-Start.html) document.

This demo app uses acoustic models in keenB2mQT-nnet3chain-en-us directory. Keen Research provides a number of custom acoustic models to its clients.

The app showcases recognition of nine digits (decoding graph is setup in AppDelegate.swift, feel free to change it to any word/phrases, etc.). If interested in large vocabulary dictation, contact us at info@keenresearch.com
