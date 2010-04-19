package Piki::ConfigLoader;
use Piki::Utils;
use Config::Divide;
use Data::Visitor::Callback;

sub load_config {
    my $home = config->{home};
    my @config_paths = ("$home/config/app/base");
    my $env = env;
    push @config_paths, "$home/config/app/$env";

    my $config = Config::Divide->load_config(
        \@config_paths,
    );

    no warnings 'uninitialized';
    my $v = Data::Visitor::Callback->new(
        scalar => sub {},
        plain_value => sub {
            $_ = "$home$1" if ($_ =~ /__path_to\((\S+)\)__/);
        },
    );

    $v->visit($config);
    return $config;
}

1;
