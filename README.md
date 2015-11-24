# Twin Prime SDK Examples

[![Build Status](https://travis-ci.org/twinprime-ci/TwinPrimeSDK-examples.svg?branch=master)](https://travis-ci.org/twinprime-ci/TwinPrimeSDK-examples)

This repository contains examples with Twin Prime SDK iOS programs.

In this directory are the 3 sample iOS applications:

- `SampleApp/`
   - Objective-C example of `NSURLRequest` usage
- `AFSample/`
   - Objective-C example of `AFNetworking` usage
- `SwiftSampleApp/`
   - Swift example of `NSURLConnection` and `NSURLSession`

# Dependencies

These examples depend on CocoaPods as a dependency manager. Please install
CocoaPods according to their documentation:

	https://guides.cocoapods.org/using/getting-started.html

You must have XCode installed together with XCode Command Line extensions.

# How to use

The directory contains the build script `build.sh`.  To build, you run:

	./build.sh

It will enter each of three directories, synchronize dependecies with Twin
Prime SDK repository, and create XCode workspaces. Created projects will be
built and recompiled.

Afterwards one can open `.xcworkspace` files and start editing them in
XCode.

# Copyright 

- Copyright (c) 2013-2015 Twin Prime Inc. All rights reserved.
- WWW: http://www.twinprime.com
