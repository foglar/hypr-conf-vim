{
  description = "Vim Styled Hyprland Configuration - A Nix flake for the vim_styled Hyprland setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Home Manager module
      homeManagerModules.vim-styled = import ./module.nix;
      homeManagerModules.default = self.homeManagerModules.vim-styled;

      # Packages for testing
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          # Test configuration build
          test-config = pkgs.writeTextFile {
            name = "vim-styled-config-test";
            text = "Configuration files would be deployed here";
          };
        }
      );

      # Check that the module can be imported
      checks = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          
          # Create a minimal home-manager configuration for testing
          testConfig = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              self.homeManagerModules.vim-styled
              {
                home = {
                  username = "testuser";
                  homeDirectory = "/home/testuser";
                  stateVersion = "24.05";
                };
                
                # Enable the vim-styled configuration
                programs.hyprland-vim-styled = {
                  enable = true;
                };
              }
            ];
          };
        in
        {
          # Check that the configuration builds
          module-builds = testConfig.activationPackage;
        }
      );

      # Development shell
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nix
              home-manager
              git
            ];
          };
        }
      );
    };
}
