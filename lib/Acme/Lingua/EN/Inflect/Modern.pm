package Acme::Lingua::EN::Inflect::Modern;
use base qw(Exporter);

use warnings;
use strict;

use Lingua::EN::Inflect ();
use Sub::Override;

BEGIN { our %EXPORT_TAGS = %Lingua::EN::Inflect::EXPORT_TAGS };

Exporter::export_ok_tags(qw( ALL ));

=head1 NAME

Acme::Lingua::EN::Inflect::Modern - modernize Lingua::EN::Inflect rule's

=head1 VERSION

version 0.004

  $Id$

=cut

our $VERSION = '0.004';

=head1 SYNOPSIS

Lingua::EN::Inflect is great for converting singular word's to plural's, but
does not always match modern usage.  This module corrects the most common
case's.

See L<Lingua::EN::Inflect> for information on using this module, which has an
identical interface.

=cut

my %todo = map { map { $_ => 1 } @$_ }
           values %Lingua::EN::Inflect::EXPORT_TAGS;

for my $routine (keys %todo) {
  no strict 'refs';
  *{__PACKAGE__ . '::' . $routine} = sub {
     my $override = Sub::Override->new(
       'Lingua::EN::Inflect::_PL_noun' => \&_PL_noun
     );

    Lingua::EN::Inflect->can($routine)->(@_);
  };
}

my $original_PL_noun;
BEGIN { $original_PL_noun = \&Lingua::EN::Inflect::_PL_noun; }

sub _PL_noun {
  my ($word, $number) = @_;

  my $plural = $original_PL_noun->($word, $number);

  return $plural if $plural eq 'his';
  return $plural if $plural eq 'us';

  if ($word =~ /es$/) {
    $plural =~ s/e(s$|s\|)/'$1/;
  } elsif ($word =~ /y$/) {
    $plural =~ s/(?:ie|y)?(s$|s\|)/y'$1/;
  } else {
    $plural =~ s/(s$|s\|)/'$1/;
  }

  return $plural;
}

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org > >>

=head1 BUG'S

Please report any bug's or feature request's the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make change's.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Ricardo SIGNES, All Right's Reserved.

This program is free software; you can redistribute it and/or modify it
under the same term's as Perl itself.

=cut

1;
