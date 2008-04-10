use inc::Module::Install;

name 'Hash-Unnest';

all_from 'lib/Hash/Unnest.pm';

build_requires 'Test::More'                 => '0.72';
build_requires 'Test::Pod'                  => '1.14';

requires 'Exporter' => '5.58';

WriteAll;

