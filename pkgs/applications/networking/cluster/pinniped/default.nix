{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec{
  pname = "pinniped";
  version = "0.19.0";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "pinniped";
    rev = "v${version}";
    sha256 = "sha256-VGvT0jj2f4+jiaPQkebL0GE+W4U8+RfSEsGr2sNBu2Q=";
  };

  subPackages = "cmd/pinniped";

  vendorSha256 = "sha256-7jQRUYJiRdYuAy3x+VPK4Nh5GF6ME7juloagm85oOVg=";

  meta = with lib; {
    description = "Tool to securely log in to your Kubernetes clusters";
    homepage = "https://pinniped.dev/";
    license = licenses.asl20;
    maintainers = with maintainers; [ bpaulin ];
  };
}
