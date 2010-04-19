package Piki::AppLoader;
use Piki::Utils;
use Module::Pluggable::Fast
    name    => 'components',
    require => 1,
    search  => [qw/Piki::Web::Controller Piki::Model Piki::Web::View/];

sub import {
    for my $p (__PACKAGE__->components) {
        $p->use;
    }
}

1;
