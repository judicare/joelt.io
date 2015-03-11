{ fetchbower, buildEnv }:
buildEnv { name = "bower-env"; ignoreCollisions = true; paths = [
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "foundation" "5.5.1" "*" "0hh0cc9n9jfvzm0w2vr8jxqk650xs9yccnc7x9iqgy1lhfv5rpp1")
  (fetchbower "modernizr" "2.8.3" "*" "1m8r2k49kn3jq8k84jhqfidm58igzdsszl8yq6irk7zx5srw5pa2")
  (fetchbower "jquery" "2.1.3" "*" "01cp6paqqhh9nq9qjj99rby8fx5lhgrdrzqfmyfdmdmdpzxdpaz5")
  (fetchbower "fontawesome" "4.3.0" "*" "105avy15c5lasavz8vynfvvi09bg9yzc7wc9n4c4m8mm5kv912zx")
]; }
