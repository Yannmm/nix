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

  system.activationScripts.postActivation.text = ''
    /usr/bin/defaults write com.apple.dock wvous-tl-corner -int 0
    /usr/bin/defaults write com.apple.dock wvous-tl-modifier -int 0

    /usr/bin/defaults write com.apple.dock wvous-tr-corner -int 0
    /usr/bin/defaults write com.apple.dock wvous-tr-modifier -int 0

    /usr/bin/defaults write com.apple.dock wvous-bl-corner -int 14
    /usr/bin/defaults write com.apple.dock wvous-bl-modifier -int 0

    /usr/bin/defaults write com.apple.dock wvous-br-corner -int 11
    /usr/bin/defaults write com.apple.dock wvous-br-modifier -int 0

    /usr/bin/killall Dock 2>/dev/null || true
  '';

  # Language / Region
  system.activationScripts.languageAndRegion.text = ''
    USER="${config.system.primaryUser}"

    sudo -u "$USER" /usr/bin/defaults write -g AppleLanguages -array \
      "en-US" \
      "zh-Hans"

    sudo -u "$USER" /usr/bin/defaults write -g AppleLocale \
      "zh_CN@calendar=gregorian"

    sudo -u "$USER" /usr/bin/defaults write -g AppleFirstWeekday -dict \
      gregorian 1
  '';
}