use Test::More;

use strict;
use warnings;

BEGIN {
  plan tests => 13;

  use_ok 'Hash::Unnest';
}

my %hash = (
  foo1 => {
    bar1 => 3,
    bar2 => 4,
  },
  foo2 => {
    bar1 => 13,
    bar2 => 14,
  },
);

unnest %hash => sub {
  my ($foo,$bar,$value) = @_;

  my $pad = 0;

  ok $foo eq 'foo1' || $foo eq 'foo2';

  ok $bar eq 'bar1' || $bar eq 'bar2';

  ok $value > 2;
};

