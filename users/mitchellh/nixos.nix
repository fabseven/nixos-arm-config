{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.mitchellh = {
    isNormalUser = true;
    home = "/home/mitchellh";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$2y$10$d6.ZaO2ukORj6KfFSbbpPeX8np9QKhVzrEG/DUA87LkD3oKqJhwZi";
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./neovim.nix { inherit inputs; })
  ];
}
