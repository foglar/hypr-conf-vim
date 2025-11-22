# Example Home Manager configuration using the vim_styled module
#
# Save this as flake.nix in your home directory or configuration directory
# and run: home-manager switch --flake .#yourusername

{
  description = "Home Manager configuration with vim_styled Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hypr-conf-vim = {
      url = "github:foglar/hypr-conf-vim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, hypr-conf-vim, ... }: {
    homeConfigurations = {
      # Replace 'yourusername' with your actual username
      "yourusername" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        
        modules = [
          # Import the vim_styled module
          hypr-conf-vim.homeManagerModules.vim-styled
          
          # Your configuration
          {
            home = {
              username = "yourusername";
              homeDirectory = "/home/yourusername";
              stateVersion = "24.05";
            };

            # Enable the vim_styled Hyprland configuration
            programs.hyprland-vim-styled = {
              enable = true;
              
              # Optional: Customize components
              enableAgs = true;
              enableNvim = true;
              enableKitty = true;
              enableCava = true;
              
              # Optional: Add extra packages
              extraPackages = with pkgs; [
                firefox
                spotify
                discord
                # Add more packages as needed
              ];
            };

            # You can add more Home Manager configuration here
            # For example:
            # programs.git = {
            #   enable = true;
            #   userName = "Your Name";
            #   userEmail = "your.email@example.com";
            # };
          }
        ];
      };
    };
  };
}
