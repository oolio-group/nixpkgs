{ stdenv
, mlton
, lib
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "initool";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "dbohdan";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-99dkog0fr+IrMyrEBDf21tSGGREgAoHcU2+MJdGIvCM=";
  };

  nativeBuildInputs = [ mlton ];

  doCheck = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp initool $out/bin/

    runHook postInstall
  '';

  meta = with lib; {
    inherit (mlton.meta) platforms;

    description = "Manipulate INI files from the command line";
    homepage = "https://github.com/dbohdan/initool";
    license = licenses.mit;
    maintainers = with maintainers; [ e1mo ];
    changelog = "https://github.com/dbohdan/initool/releases/tag/v${version}";
  };
}

