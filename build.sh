#!/bin/sh
#
#  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
#  All rights reserved.
#

echo "# About to build all Twin Prime SDK sample iOS apps"
echo "# For this to work you must have CocoaPods installed"

set -x
for APP in SampleApp SampleSwiftApp AFSample; do
	echo "# building $APP"
	(
		cd $APP
		pod install
		xcodebuild -workspace ${APP}.xcworkspace -scheme $APP
	)
done
