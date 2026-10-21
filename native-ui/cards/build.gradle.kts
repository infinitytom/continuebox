plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}
android {
    namespace = "com.continuebox.nativeui"
    compileSdk = 35
    defaultConfig { minSdk = 21 }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions { jvmTarget = "1.8" }
}
dependencies {
    // Compile against the exact engine version; the existing APK supplies these classes.
    compileOnly(files("../../tools/deps/okhttp-3.12.13.jar", "../../tools/deps/okio-1.15.0.jar"))
}
