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
  home.stateVersion = "22.11";

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
    "ci" = "/usr/local/bin/codium-insiders .";
    "ga" = "git add";
    "gp" = "git push";
    "gaa" = "git add --all";
    "l" = "ls -lah";
    "la" = "ls -lAh";
    "ll" = "ls -lh";
    "ls" = "ls -G";
    "lsa" = "ls -lah";
    "md" = "mkdir -p";
    "gss" = "git status -s";
    "gst" = "git status";
  };

  programs.git.enable = true;

  programs.direnv.enable = true;
  #programs.direnv.enableFishIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  #programs.kitty.enable = true;

  targets.darwin.defaults."com.apple.Safari".IncludeDevelopMenu = true;
  targets.darwin.search = "DuckDuckGo";

  home.packages = with pkgs; [
    docker
    bottom
    wget
    jq
    du-dust
    git-crypt
    neovim
    fzf
    awscli
    jetbrains-mono
    zellij
];

  fonts.fontconfig.enable = true;
}
