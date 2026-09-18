{ config, ... }:

{
  system.defaults = {

    NSGlobalDomain = {
      # Language/region-related formatting
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";

      KeyRepeat = 2;
      InitialKeyRepeat = 15;

      # Natural scrolling
      "com.apple.swipescrolldirection" = true;

      # Trackpad tracking speed
      "com.apple.trackpad.scaling" = 1.2;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleLanguages = [
          "en-US"
          "zh-Hans"
        ];

        AppleLocale = "en_US";
      };
    };

    trackpad = {
      # Point & Click
      Clicking = true;
      TrackpadRightClick = true;

      FirstClickThreshold = 1;       # Medium click
      ActuationStrength = 1;         # Quiet Click OFF
      ForceSuppressed = false;       # Force Click ON
      ActuateDetents = true;         # Haptic feedback ON
      TrackpadThreeFingerTapGesture = 2; # Look up & data detectors

      # Scroll & Zoom
      TrackpadPinch = true;                  # Zoom in or out
      TrackpadTwoFingerDoubleTapGesture = true; # Smart zoom
      TrackpadRotate = true;                 # Rotate

      # More Gestures
      TrackpadThreeFingerHorizSwipeGesture = 2; # Full-screen apps
      TrackpadThreeFingerVertSwipeGesture = 0;  # Mission Control/App Exposé OFF
      TrackpadFourFingerVertSwipeGesture = 0;

      TrackpadTwoFingerFromRightEdgeSwipeGesture = 3; # Notification Center

      # Show Desktop
      TrackpadFourFingerPinchGesture = 2;
    };

    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;

      showAppExposeGestureEnabled = false;
      showMissionControlGestureEnabled = false;
      showDesktopGestureEnabled = true;

      wvous-bl-corner = 14; # Quick Note
      wvous-br-corner = 11; # Launchpad
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "clmv";
    };

    screencapture = {
      type = "png";
      disable-shadow = true;
    };
  };
}