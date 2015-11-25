# Twin Prime SDK Examples

[![Build Status](https://travis-ci.org/twinprime-ci/TwinPrimeSDK-examples.svg?branch=master)](https://travis-ci.org/twinprime-ci/TwinPrimeSDK-examples)

This repository contains 3 sample apps that showcase how to integrate the Twin Prime SDK in iOS.

- `SampleApp/`: Objective-C sample app using `NSURLRequest`
- `AFSample/` : Objective-C sample app using `AFNetworking`
- `SwiftSampleApp/`: Swift sample app using `NSURLConnection` and `NSURLSession`

# Dependencies

In order to use these sample apps, you need CocoaPods. To install CocoaPods, go [here] (https://guides.cocoapods.org/using/getting-started.html).

You must have XCode installed together with XCode Command Line extensions.

# How to use the Sample Apps

The directory contains the build script `build.sh`.  To build, you run:

	./build.sh

The script will synchronize dependecies between the sample apps and the Twin Prime SDK repository and create XCode workspaces. All created projects will be built and recompiled.

Once complete, you can open `.xcworkspace` files and start editing them in XCode.

# Copyright 

- Copyright (c) 2013-2015 Twin Prime Inc. All rights reserved.
- WWW: http://www.twinprime.com
