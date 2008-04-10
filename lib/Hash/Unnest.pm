package Hash::Unnest;

use Exporter qw/import/;

use strict;
use warnings;

our $VERSION = '0.00_01';

our @EXPORT = qw/unnest/;

sub unnest (\%&) {
  my ($hash,$coderef,@values) = @_;

  while (my ($key,$value) = each (%$hash)) {
    if (ref $value eq 'HASH') {
      &unnest ($value,$coderef,@values,$key);
    } else {
      $coderef->(@values,$key,$value);
    }
  }

  return;
}

1;

=pod

=head1 NAME

Hash::Unnest - Simple deep hash iterator

=head1 SYNOPSIS

  my %hash = (
    foo => {
      bar => 'baz';
      bar2 => 'baz2';
    },
  );

  unnest %hash => sub {
    my ($foo,$bar,$baz) = @_;

    print "$foo $bar $baz\n";
  };

=head1 DESCRIPTION

Docs a bit slim at this stage, since it's only a developer release but
you should be able to figure out its relatively simple behaviour from
the synopsis section.

=head1 BUGS

Most software has bugs. This module probably isn't an exception. 
If you find a bug please either email me, or add the bug to cpan-RT.

=head1 AUTHOR

Anders Nor Berle E<lt>berle@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Anders Nor Berle.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

