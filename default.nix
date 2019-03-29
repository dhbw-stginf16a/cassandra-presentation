with import <nixpkgs> {};
let
  reveal-js = fetchFromGitHub {
    owner = "hakimel";
    repo = "reveal.js";
    rev = "3.7.0";
    sha256 = "1raqacq2c6rcbqkli1jygw68nqs090zm59zrbdvflk6y1mzk93nd";
  };
  #reveal-js = fetchurl {
  #  name = "reveal.js.tar.gz";
  #  url = "https://github.com/hakimel/reveal.js/archive/master.tar.gz";
  #  sha256 = "0hxwrdg547q9x51zji373l8jvj00v6zlqxmwvfcf51fj62bn7pf7";
  #};
  src = ./.;
  #src = fetchFromGitHub {
  #  owner = "dhbw-stginf16a";
  #  repo = "cassandra-presentation";
  #  rev = "";
  #  sha256 = "";
  #};
in
stdenv.mkDerivation {
  name = "cassandra-presentation";

  srcs = [ src reveal-js ];
  #sourceRoot = src.name;

  buildInputs = with pkgs; [ pandoc ];

  preBuild = "make clean";

  installPhase = ''
    mkdir -p $out
    cp presentation.html $out/index.html
    cp -r ${reveal-js.name} $out
  '';

  meta.description = "Presentation introduction Apache Cassandra";
}
