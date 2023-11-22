{ config, pkgs, libs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "stojce";
  home.homeDirectory = "/Users/stojce";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bat.enable = true;
  programs.bat.config.theme = "OneHalfDark";
  programs.dircolors.enable = true;
  programs.dircolors.enableFishIntegration = true;

  programs.fish.enable = true;
  #programs.fish.shellAliases = (import ./modules/aliases.nix);

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
  programs.direnv.enableFishIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  targets.darwin.defaults."com.apple.Safari".IncludeDevelopMenu = true;
  targets.darwin.search = "DuckDuckGo";

  home.packages = with pkgs; [
    # TEMP
    mono
    # TEMP
    babelfish
    qemu
    podman
    podman-compose
    podman-tui
    utm
    # UTM ISO buildPackages
    aria
    cabextract
    wimlib
    chntpw
    cdrtools
    #^
    ranger
    mosh
    imagemagick
    gettext
    gnupg
    pinentry_mac
    bottom
    wget
    jq
    du-dust
    git-crypt
    git-lfs
    pre-commit
    neovim
    fzf
    awscli2
    jetbrains-mono
    fira-code
    zellij
];

  fonts.fontconfig.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
