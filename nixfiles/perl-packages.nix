pkgs: with pkgs.perlPackages; rec {
  TypeTinyXS = buildPerlPackage rec {
    name = "Type-Tiny-XS-0.012";
    src = fetchurl {
      url = "mirror://cpan/authors/id/T/TO/TOBYINK/Type-Tiny-XS-0.012.tar.gz";
      sha256 = "05nbr898cvjjh1wsy55l84zasx65gijdxc6dnn558ihns8zx6gm9";
    };
  };

  AppSqitch = buildPerlModule rec {
    name = "App-Sqitch-0.9992";
    src = fetchurl {
      url = "mirror://cpan/authors/id/D/DW/DWHEELER/${name}.tar.gz";
      sha256 = "1w2x5w5pbkd1dbqpwl19z1kj0sxma5mz6df0hslhc8x3m6ypg1gp";
    };
    buildInputs = [
      CaptureTiny ConfigGitLike ClassXSAccessor DateTime DBI EncodeLocale FileHomeDir
      HashMerge IOPager IPCSystemSimple libintl_perl Moo namespaceautoclean PathClass
      PerlIOutf8_strict StringFormatter StringShellQuote SubExporter TemplateTiny TestDeep
      TestDir TestException TestFile TestFileContents TestMockModule TestNoWarnings
      Throwable TryTiny TypeTiny TypeTinyXS URIdb
      pkgs.makeWrapper
    ];

    perlPostHook = ''
      wrapProgram $out/bin/sqitch --prefix PERL5LIB : ${
        pkgs.lib.makePerlPath (buildInputs ++ [
          BHooksEndOfScope ClassLoad ClassMethodModifiers DataOptList
          DevelGlobalDestruction ExporterTiny FileWhich ImportInto ListMoreUtils
          ModuleImplementation ModuleRuntime MooXTypesMooseLike namespaceclean
          PackageStash ParamsUtil PathClass RoleTiny strictures SubExporterProgressive
          SubIdentify SubInstall URI URINested
        ])
      }:$out/lib/perl5/site_perl
    '';
  };
}
