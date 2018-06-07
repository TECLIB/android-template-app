/**
 *  LICENSE
 *
 *  This file is part of Android Template App.
 *
 *  Android Template App is a subproject of Teclib.
 *
 *  Android Template App is free software: you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 3
 *  of the License, or (at your option) any later version.
 *
 *  Android Template App is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  ------------------------------------------------------------------------
 *  @author    Rafael Hernandez <rhernandez@teclib.com>
 *  @copyright Copyright (c) 2018 Teclib
 *  @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 *  @link      https://github.com/TECLIB/android-template-app/
 *  @link      https://teclib.github.io/android-template-app/
 *  @link      https://teclib-edition.com/en/
 *  ------------------------------------------------------------------------
 */

package app.template.s42.templateandroid;

import android.content.Context;
import android.support.test.InstrumentationRegistry;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.*;

/**
 * Instrumented test, which will execute on an Android device.
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
@RunWith(AndroidJUnit4.class)
public class ExampleInstrumentedTest {
    @Test
    public void useAppContext() {
        // Context of the app under test.
        Context appContext = InstrumentationRegistry.getTargetContext();

        assertEquals("app.template.s42.templateandroid", appContext.getPackageName());
    }
}
