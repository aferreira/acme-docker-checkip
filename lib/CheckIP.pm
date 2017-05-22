
package CheckIP;

use Mojo::Base 'Mojo';

use Mojolicious::Commands;
use Scalar::Util;

has commands => sub {
    my $commands = Mojolicious::Commands->new( app => shift );
    Scalar::Util::weaken $commands->{app};
    return $commands;
};

sub handler {
    my ( $self, $tx ) = @_;

    my $ip = $tx->remote_address;

    # Response
    $tx->res->code(200);
    $tx->res->headers->content_type('text/plain');
    $tx->res->body("$ip\n");

    # Resume transaction
    $tx->resume;
}

sub start {
    my $self = shift;
    return $self->commands->run( @_ ? @_ : @ARGV );
}

1;