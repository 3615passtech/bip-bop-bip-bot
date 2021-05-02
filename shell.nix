with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    ruby
    zlib # required by 'nokogiri'
  ];
}
