{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-marketplace; [
      aliariff.vscode-erb-beautify
      anthropic.claude-code
      bbenoist.nix
      castwide.solargraph
      codemos.codemos-modern
      dart-code.dart-code
      dart-code.flutter
      kaiqun.build-runner
      kaiwood.endwise
      localizely.flutter-intl
      mk12.better-git-line-blame
      ms-ossdata.vscode-pgsql
      ms-python.debugpy
      ms-python.python
      ms-python.vscode-pylance
      ms-python.vscode-python-envs
      oderwat.indent-rainbow
      pejmannikram.vscode-auto-scroll
      ritwickdey.liveserver
    ];

    profiles.default.userSettings = {
      "extensions.autoUpdate" = "off";
      "extensions.autoCheckUpdates" = false;
      "editor.wordWrap" = "on";
      "dart.debugSdkLibraries" = false;
      "explorer.confirmDelete" = false;
      "dart.showInspectorNotificationsForWidgetErrors" = false;
      "explorer.confirmDragAndDrop" = false;
      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.rulers" = [80];
        "editor.selectionHighlight" = false;
        "editor.suggest.snippetsPreventQuickSuggestions" = false;
        "editor.suggestSelection" = "first";
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = "off";
      };
      "[javascript]" = {
        "editor.formatOnSave" = true;
      };
      "[typescript]" = {
        "editor.formatOnSave" = true;
      };
      "[css]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "vscode.css-language-features";
      };
      "[html]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "vscode.html-language-features";
      };
      "[art]" = {
        "editor.formatOnSave" = true;
      };
      "emmet.includeLanguages" = {
        "javascript" = "javascriptreact";
        "erb" = "html";
        "ruby" = "html";
      };
      "tailwindCSS.includeLanguages" = {
        "plaintext" = "html";
      };
      "emmet.triggerExpansionOnTab" = true;
      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
      };
      "workbench.editor.enablePreview" = false;
      "dart.debugExternalPackageLibraries" = true;
      "files.associations" = {
        "*.html.erb" = "erb";
        "*.css" = "tailwindcss";
      };
      "[erb]" = {
        "editor.defaultFormatter" = "aliariff.vscode-erb-beautify";
        "editor.formatOnSave" = true;
      };
      "vscode-erb-beautify.customEnvVar" = {
        "LC_ALL" = "en_US.UTF-8";
      };
      "[ruby]" = {
        "editor.defaultFormatter" = "rubocop.vscode-rubocop";
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.semanticHighlighting.enabled" = true;
        "editor.formatOnType" = false;
      };
      "editor.renderWhitespace" = "none";
      "security.workspace.trust.untrustedFiles" = "open";
      "liveServer.settings.donotVerifyTags" = true;
      "liveServer.settings.donotShowInfoMsg" = true;
      "editor.quickSuggestions" = {
        "strings" = "on";
      };
      "indentRainbow.ignoreErrorLanguages" = ["*"];
      "indentRainbow.colorOnWhiteSpaceOnly" = true;
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.tabSize" = 2;
      "workbench.colorTheme" = "Codemos Modern (Dark)";
      "terminal.integrated.inheritEnv" = true;
      "terminal.integrated.defaultProfile.osx" = "zsh";
      "rufo.exe" = "rufo";
      "rufo.args" = [];
      "rufo.useBundler" = false;
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "github.copilot.nextEditSuggestions.enabled" = true;
      "amazonQ.suppressPrompts" = {
        "amazonQChatDisclaimer" = true;
        "amazonQSessionConfigurationMessage" = true;
      };
      "chat.tools.terminal.autoApprove" = {
        "flutter" = true;
        "rspec" = true;
        "xcodebuild" = true;
        "dart" = true;
      };
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = false;
        "scminput" = false;
        "ruby" = true;
      };
      "rubocop.mode" = "onlyRunGlobally";
      "chat.mcp.gallery.enabled" = true;
      "chat.viewSessions.orientation" = "stacked";
      "claudeCode.preferredLocation" = "panel";
      "diffEditor.hideUnchangedRegions.enabled" = true;
    };
  };
}
