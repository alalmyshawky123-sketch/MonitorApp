#!/bin/bash
# سكربت تلقائي لإنشاء هيكل مشروع أندرويد متكامل وتوليد ملف APK
npx @react-native-community/cli init MonitorAppTemp --skip-install || true

# أو بدلاً من ذلك، سنقوم بإنشاء هيكلGradle يدوي سريع وبسيط لتوليد التطبيق
mkdir -p app/src/main/java/com/monitor/app
mkdir -p app/src/main/res/values

cat << 'EOF' > build.gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath "com.android.tools.build:gradle:7.4.2"
    }
}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
EOF

cat << 'EOF' > settings.gradle
include ':app'
rootProject.name = "MonitorApp"
EOF

cat << 'EOF' > app/build.gradle
plugins {
    id 'com.android.application'
}
android {
    compileSdk 33
    defaultConfig {
        applicationId "com.monitor.app"
        minSdk 21
        targetSdk 33
        versionCode 1
        versionName "1.0"
    }
}
dependencies {
    implementation 'androidx.core:core-ktx:1.9.0'
    implementation 'androidx.appcompat:appcompat:1.6.1'
}
EOF

cat << 'EOF' > app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.monitor.app">
    <application
        android:label="MonitorApp"
        android:theme="@style/Theme.AppCompat.Light.NoActionBar">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF

cat << 'EOF' > app/src/main/java/com/monitor/app/MainActivity.kt
package com.monitor.app
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }
}
EOF
