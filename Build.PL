
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => '6.30',
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Facilitates the creation and modification of PDF files',
  'dist_author' => [
    'Steve Simms <steve@deefs.net>'
  ],
  'dist_name' => 'PDF-API2',
  'dist_version' => '2.019',
  'license' => 'lgpl',
  'module_name' => 'PDF::API2',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Compress::Zlib' => '1.0',
    'Font::TTF' => '0',
    'perl' => 'v5.8.1'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
