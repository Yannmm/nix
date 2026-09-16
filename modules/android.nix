{ pkgs, inputs, ... }:

let
  androidSdk = inputs.android-nixpkgs.sdk.aarch64-darwin (
    sdkPkgs: with sdkPkgs; [
      cmdline-tools-latest

      build-tools-34-0-0
      platform-tools
      emulator

      platforms-android-34

      system-images-android-34-google-apis-arm64-v8a
      system-images-android-34-google-apis-playstore-arm64-v8a
    ]
  );

  create-emulator = pkgs.writeScriptBin "create-emulator" ''
    set -e

    avdmanager delete avd -n test_emulator 2>/dev/null || true

    avdmanager create avd \
      -n test_emulator \
      -k "system-images;android-34;google_apis_playstore;arm64-v8a" \
      -d "pixel_4" \
      --force
  '';

  start-emulator = pkgs.writeScriptBin "start-emulator" ''
    emulator \
      -avd test_emulator \
      -no-boot-anim \
      -no-snapshot \
      -no-accel \
      -gpu on \
      &
  '';

  kill-emulator = pkgs.writeScriptBin "kill-emulator" ''
    for device in $(adb devices | awk '/^emulator-/ {print $1}'); do
      adb -s "$device" emu kill
      echo "🛑 Emulator $device killed"
    done
  '';

in
{
  environment.systemPackages = [
    androidSdk
    create-emulator
    start-emulator
    kill-emulator
  ];

  environment.variables = {
    ANDROID_SDK_ROOT = "${androidSdk}/share/android-sdk";
    ANDROID_HOME = "${androidSdk}/share/android-sdk";
  };
}