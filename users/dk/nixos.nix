{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.dk = {
    isNormalUser = true;
    home = "/home/dk";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$2y$10$d6.ZaO2ukORj6KfFSbbpPeX8np9QKhVzrEG/DUA87LkD3oKqJhwZi";
		openssh.authorizedKeys.keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLz04NeyMhQCWLx/hMivksD0Avu5CGqSVC+1hHi9dWW fabbycrafted@gmail.com"
		];
  };
}
