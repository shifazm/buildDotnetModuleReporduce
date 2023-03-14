{
  lib
, buildDotnetModule
, stdenv
, libunwind
, libuuid
, icu
, openssl
, zlib
, curl
, dotnet-sdk
}:
buildDotnetModule rec {
  inherit dotnet-sdk;

  pname = "DotnetSlnWithManyNugets";
  version = "0.0.1";
  src = ./.;

  projectFile = "./many-nugets.sln";
  nugetDeps = ./deps.nix;

  nativeBuildInputs = [
    ];
  runtimeDeps = [
    stdenv.cc.cc
    libunwind
    libuuid
    icu
    openssl
    zlib
    curl
  ];
  dotnetFlags = [
  ];
  dotnetPackFlags = [
    "-p:PublishNativeAot=True"
    #"-p:TargetsForTfmSpecificContentInPackage="
  ];
  executables = [];
  packNupkg = true;
  meta = with lib; {
    license = licenses.mit;
    maintainers = with maintainers; [ anpin ];
    platforms = [ "x86_64-linux" ];
  };
}
