#!/usr/bin/perl -w
use strict;
use Module::Build::WithXSpp;

my $build = Module::Build::WithXSpp->new(
  module_name     => 'Math::Clipper',
  license         => 'perl',
  # _GLIBCXX_USE_C99 : to get the long long type for g++
  # HAS_BOOL         : stops Perl/lib/CORE/handy.h from doing "#  define bool char" for MSVC
  extra_compiler_flags => [qw(-D_GLIBCXX_USE_C99 -DHAS_BOOL)],
  # Provides extra C typemaps that are auto-merged
  extra_typemap_modules => {
    'ExtUtils::Typemaps::Default' => '0.05',
  },
  #for MSVC builds
  early_includes => [qw(
    cstdio
    cstdlib
    )]
);

$build->create_build_script;
