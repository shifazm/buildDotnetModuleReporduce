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
  
  dotnetPackFlags = [
    "-p:TargetsForTfmSpecificContentInPackage=" # workaround for NETSDK1085 when packing with --no-build https://github.com/dotnet/fsharp/issues/12320
  ];
  executables = [];
  packNupkg = true;
  meta = with lib; {
    license = licenses.mit;
    maintainers = with maintainers; [ anpin ];
    platforms = [ "x86_64-linux" ];
  };
}
