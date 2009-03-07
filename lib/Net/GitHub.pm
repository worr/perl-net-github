package Net::GitHub;

use Moose;

our $VERSION = '0.01';
our $AUTHORITY = 'cpan:FAYLAND';

use Net::GitHub::Project;

with 'Net::GitHub::Role';

has 'project' => (
    is => 'rw',
    isa => 'Net::GitHub::Project',
    lazy => 1,
    default => sub {
        my $self = shift;
        return Net::GitHub::Project->new( $self->args_to_pass );
    }
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;
__END__

=head1 NAME

Net::GitHub - Perl Interface for github.com

=head1 SYNOPSIS

    use Net::GitHub;

    # for http://github.com/fayland/perl-net-github/tree/master
    my $github = Net::GitHub->new( owner => 'fayland', name => 'perl-net-github' );
    print $github->project->public_clone_url;

=head1 DESCRIPTION

L<http://github.com> is a popular git host.

Please feel free to fork L<http://github.com/fayland/perl-net-github/tree/master>, fix or contribute some code. :)

=head1 METHODS

=head2 $github->project

instance of L<Net::GitHub::Project>

=head1 Git URL

L<http://github.com/fayland/perl-net-github/tree/master>

=head1 SEE ALSO

L<Moose>

=head1 AUTHOR

Fayland Lam, C<< <fayland at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Fayland Lam, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
