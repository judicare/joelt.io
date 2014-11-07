{ fetchbower, lib }:
let paths = [
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "jquery" "2.1.1" "*" "15ds8rgvnqkzndp9q06sbsgm6ql3gwj3vn173n3dv8b22ldxaicv")
  (fetchbower "bootstrap" "3.3.0" "*" "1cxzg69bfv9z4j94cs2vfzdvfi6q5h7m47qblz8jmrjjrs5i5ig9")
]; in
{
  link = ''
    if ! test -d bower_components; then
      mkdir -p bower_components
      ${lib.concatStringsSep "\n"
        (builtins.map (p:
          let drv = builtins.parseDrvName p.name;
          in "ln -sv ${p}/packages/*/* bower_components/${drv.name}")
        paths)
       }
    fi
  '';
}
