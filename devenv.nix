{ pkgs, lib, config, inputs, ... }:

{


  packages = [
      pkgs.curl
      pkgs.git
      pkgs.jq
      pkgs.just

      pkgs.rustup
      pkgs.sccache
      pkgs.cargo-outdated
      pkgs.cargo-nextest
      pkgs.cargo-audit
      pkgs.rust-analyzer
  ] ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
       frameworks.SystemConfiguration
       frameworks.Security
       frameworks.CoreFoundation
     ]);

  languages.nix.enable = true;

  languages.rust.enable = true;
  languages.rust.channel = "nightly";
  languages.rust.components = [ "rustc" "cargo" "rust-src" "rust-std" ];
}
