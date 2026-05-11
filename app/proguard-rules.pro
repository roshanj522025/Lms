# Keep WebView JavaScript interface classes
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep app classes
-keep class com.kristujayantiexamlms.** { *; }

# AndroidX
-keep class androidx.** { *; }
-dontwarn androidx.**
