with import <nixpkgs> {};

let
  latexPackage = texlive.combine {
    inherit (texlive)
      scheme-small

      latexmk

      beamer
      beamertheme-metropolis
      appendixnumberbeamer
      ccicons
      pgfopts
      pgfplots

      siunitx
      ;
  };

  pplatex =
    stdenv.mkDerivation rec {
      name = "pplatex-${version}";
      version = "1.0-rc2";

      src = fetchFromGitHub {
        owner = "stefanhepp";
        repo = "pplatex";
        rev = name;
        sha256 = "0xw7nvi2l15iyp9sm8vmmqghi54v99bcivqvx89f5v2gw0kw47k3";
      };

      buildInputs = [ cmake pkgconfig pcre ];

      installPhase = ''
        install -D src/pplatex $out/bin/pplatex
      '';
    };
in
  stdenv.mkDerivation rec {
    name = "cassandra-overview";

    src = ./.;

    buildInputs = [
      latexPackage pplatex
    ];

    # We could be building from an unclean directory, so remove intermediate files first
    preBuild = "make clean";

    installPhase = ''
      install -D presentation.pdf $out
    '';

    checkPhase = ''
      function build_error() {
        echo "=====> There have been warnings or errors in the last run, fix them!"
        exit 1
      }

      cat latexmk_log.txt | grep "o) Errors:" | tail -1 | grep "o) Errors: 0, Warnings: 0" || build_error
    '';
  }
