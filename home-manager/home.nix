{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "stojce";
  home.homeDirectory = "/Users/stojce";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.


  programs.bat.enable = true;
  programs.bat.config.theme = "OneHalfDark";
  programs.dircolors.enable = true;
  programs.dircolors.enableFishIntegration = true;

  programs.fish.enable = true;

  programs.fish.shellAliases = {
    g = "git";
    "..." = "cd ../..";
    "hm" = "pushd ~/.config/nixpkgs;  home-manager switch; popd";
    "gl" = "git pull";
    "gpf!" = "git push --force";
    "cl" = "/usr/local/bin/codium .";
    "ga" = "git add";
    "gp" = "git push";
    "gcs" = "git commit -S";
    "gcss" = "git commit -S -s";
    "gcssm" = "git commit -S -s -m";
    "gaa" = "git add --all";
    "l" = "ls -lah";
    "la" = "ls -lAh";
    "ll" = "ls -lh";
    "ls" = "ls -G";
    "lsa" = "ls -lah";
    "md" = "mkdir -p";
    "gss" = "git status -s";
    "gst" = "git status";
    "r" = "ranger";
    "nfu" = "sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'";
  };

  programs.git.enable = true;

  programs.direnv.enable = true;
  # programs.direnv.enableFishIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  targets.darwin.defaults."com.apple.Safari".IncludeDevelopMenu = true;
  targets.darwin.search = "DuckDuckGo";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    mosh
    
    git-crypt
    git-lfs
    pre-commit
    wget
    jq
    du-dust
  
    neovim
    jetbrains-mono
    fira-code
    zellij

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #  echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/stojce/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
