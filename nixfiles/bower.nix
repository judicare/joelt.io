{ fetchbower, buildEnv }:
buildEnv { name = "bower-env"; ignoreCollisions = true; paths = [
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "jquery" "2.1.3" "*" "01cp6paqqhh9nq9qjj99rby8fx5lhgrdrzqfmyfdmdmdpzxdpaz5")
  (fetchbower "bootstrap" "3.3.2" "*" "1rdwbyfxkrdq312qvlrphi01a993nghc2zbj8293bn43gcx8pwap")
]; }
