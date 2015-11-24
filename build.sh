#!/bin/sh
#
#  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
#  All rights reserved.
#

echo "# About to build all Twin Prime SDK sample iOS apps"
echo "# For this to work you must have CocoaPods installed"

set -x

printenv | grep TRAVIS

OPTS=""
if [ "x${TRAVIS}" != "x" ]; then
	OPTS='CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY='
fi

TOOL=xcodebuild
if [ "${BUILDTOOL}" = "xctool" ]; then
	TOOL=xctool
fi

for APP in SampleApp SampleSwiftApp AFSample; do
	echo "# building $APP"
	(
		cd $APP
		pod install
		$TOOL $OPTS -workspace ${APP}.xcworkspace -scheme $APP
	)
done
