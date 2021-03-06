#!/usr/bin/env bash
#
#  LICENSE
#
#  This file is part of Android Template App.
#
#  Android Template App is a subproject of Teclib.
#
#  Android Template App is free software: you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 3
#  of the License, or (at your option) any later version.
#
#  Android Template App is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  ------------------------------------------------------------------------
#  @author    Rafael Hernandez <rhernandez@teclib.com>
#  @copyright Copyright (c) 2018 Teclib
#  @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
#  @link      https://github.com/TECLIB/android-template-app/
#  @link      https://teclib.github.io/android-template-app/
#  @link      https://teclib-edition.com/en/
#  ------------------------------------------------------------------------
#

# increment version code, need to be unique to send to store
# this factor is used if you need increase you version code to deploy on Google Play by default is 0
./gradlew updateVersionCode

# increment version name on package.json, create tag and commit with changelog
npm run release -- -m "ci(release): generate CHANGELOG.md for version %s"

if [[ $CIRCLE_BRANCH == *"master"* ]]; then
    # Get version number from package.json
    export GIT_TAG=$(jq -r ".version" package.json)

    # update version name generate on package json
    ./gradlew updateVersionName -P vName=$GIT_TAG
fi

git add app/src/main/AndroidManifest.xml
git commit -m "ci(release): update version on android manifest"
git push origin $CIRCLE_BRANCH