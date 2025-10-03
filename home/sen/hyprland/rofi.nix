{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = builtins.toFile "custom-theme.rasi" ''
      * {
          bg-color: #202020;
          bg-alt: #2d2d30;
          fg-color: #ffffff;
          fg-alt: #cccccc;
          border-color: #3f3f46;
          selected-color: #ffffff;
          selected-bg: #2d2d30;
          urgent-color: #ffffff;
          urgent-bg: #f44747;

          font: "JetBrains Mono Nerd Font 12";
          
          background-color: transparent;
          text-color: @fg-color;
          margin: 0;
          padding: 0;
          spacing: 0;
      }

      window {
          background-color: @bg-color;
          border: 1px solid;
          border-color: @border-color;
          border-radius: 0px;
          width: 600px;
          location: center;
          anchor: center;
          transparency: "real";
      }

      mainbox {
          background-color: transparent;
          children: [ "inputbar", "message", "listview" ];
          spacing: 12px;
          padding: 16px;
      }

      inputbar {
          background-color: @bg-alt;
          text-color: @fg-color;
          border: 1px solid;
          border-color: @border-color;
          border-radius: 0px;
          padding: 8px 12px;
          children: [ "prompt", "textbox-prompt-sep", "entry", "case-indicator" ];
      }

      prompt {
          background-color: transparent;
          text-color: @fg-color;
          font: "JetBrains Mono Nerd Font Bold 12";
          margin: 0px 8px 0px 0px;
      }

      textbox-prompt-sep {
          background-color: transparent;
          text-color: @fg-alt;
          expand: false;
          str: "│";
          margin: 0px 8px 0px 0px;
      }

      entry {
          background-color: transparent;
          text-color: @fg-color;
          placeholder-color: @fg-alt;
          expand: true;
          horizontal-align: 0;
          placeholder: "Search...";
          cursor: text;
          blink: true;
      }

      case-indicator {
          background-color: transparent;
          text-color: @fg-alt;
          spacing: 0;
      }

      listview {
          background-color: transparent;
          columns: 1;
          lines: 8;
          cycle: true;
          dynamic: true;
          scrollbar: false;
          layout: vertical;
          reverse: false;
          fixed-height: true;
          fixed-columns: true;
          spacing: 2px;
          margin: 8px 0px 0px 0px;
      }

      element {
          background-color: transparent;
          text-color: @fg-color;
          orientation: horizontal;
          border-radius: 0px;
          padding: 8px 12px;
          spacing: 8px;
          border: 0px;
      }

      element-icon {
          background-color: transparent;
          text-color: inherit;
          size: 24px;
          cursor: inherit;
      }

      element-text {
          background-color: transparent;
          text-color: inherit;
          expand: true;
          cursor: inherit;
          vertical-align: 0.5;
          horizontal-align: 0.0;
      }

      element normal.normal {
          background-color: transparent;
          text-color: @fg-color;
      }

      element normal.urgent {
          background-color: @urgent-bg;
          text-color: @urgent-color;
      }

      element normal.active {
          background-color: @selected-bg;
          text-color: @selected-color;
      }

      element selected.normal {
          background-color: @selected-bg;
          text-color: @selected-color;
          border: 0px;
      }

      element selected.urgent {
          background-color: @urgent-bg;
          text-color: @urgent-color;
          border: 0px;
      }

      element selected.active {
          background-color: @selected-bg;
          text-color: @selected-color;
          border: 0px;
      }

      element alternate.normal {
          background-color: transparent;
          text-color: @fg-color;
      }

      element alternate.urgent {
          background-color: @urgent-bg;
          text-color: @urgent-color;
      }

      element alternate.active {
          background-color: @selected-bg;
          text-color: @selected-color;
      }

      scrollbar {
          width: 4px;
          border: 0px;
          handle-color: @fg-alt;
          handle-width: 8px;
          padding: 0;
          margin: 0px 4px 0px 0px;
      }

      sidebar {
          border: 0px;
          border-color: @border-color;
          border-radius: 0px;
      }

      button {
          spacing: 0;
          text-color: @fg-color;
          background-color: transparent;
          border: 1px solid;
          border-color: @border-color;
          border-radius: 0px;
          padding: 4px 8px;
          margin: 2px;
      }

      button selected {
          background-color: @selected-bg;
          text-color: @selected-color;
          border-color: @selected-bg;
      }

      message {
          background-color: @bg-alt;
          border: 1px solid;
          border-color: @border-color;
          border-radius: 0px;
          padding: 8px 12px;
          margin: 0px 0px 8px 0px;
      }

      textbox {
          background-color: transparent;
          text-color: @fg-color;
          vertical-align: 0.5;
          horizontal-align: 0.0;
      }

      error-message {
          background-color: @urgent-bg;
          border: 1px solid;
          border-color: @urgent-bg;
          border-radius: 0px;
          padding: 12px;
          margin: 16px;
      }

      mode-switcher {
          spacing: 8px;
          background-color: transparent;
          border: 0px;
          margin: 8px 0px 0px 0px;
      }

      configuration {
          show-icons: true;
          icon-theme: "Papirus-Dark";
          display-drun: " Apps";
          display-run: " Run";
          display-window: "󰖯 Windows";
          display-ssh: " SSH";
          display-combi: " All";
          drun-display-format: "{name}";
          window-format: "{w} {c} {t}";
      }
    '';
  };
}
