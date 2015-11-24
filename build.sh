#!/bin/sh
#
#  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
#  All rights reserved.
#

echo "# About to build all Twin Prime SDK sample iOS apps"
echo "# For this to work you must have CocoaPods installed"

OPTS=""
if [ "x${TRAVIS}" != "x" ]; then
	OPTS="CODE_SIGNING_REQUIRED=NO"
fi

set -x
for APP in SampleApp SampleSwiftApp AFSample; do
	echo "# building $APP"
	(
		cd $APP
		pod install
		xcodebuild $OPTS -workspace ${APP}.xcworkspace -scheme $APP
	)
done
