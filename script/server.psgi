use lib qw/lib/;
BEGIN {
    $ENV{SKINNY_TRACE} = 1 if $ENV{PIKI_ENV} ne 'production';
}
use Plack::Builder;
use Plack::Middleware::Session;
use Plack::Session::Store::DBI;
use Getopt::Long;
use Piki;
use Piki::AppLoader;
use Piki::Utils;
use Piki::Web::Handler;

my %args;
GetOptions(\%args, qw/port=i trace/);

Piki->setup;

my $home = config->{home} . 'htdocs';
my $app = sub {
    my $env = shift;
    Piki::Web::Handler->handler($env);
};

builder {
    enable "Plack::Middleware::StackTrace";
    enable "Plack::Middleware::Static",
        path => qr{(?:jpe?g|gif|png|css|ico|html?|js)$},
        root => $home;
    enable 'Session',
        store => Plack::Session::Store::DBI->new(
            dbh => DBI->connect(@{dbi_config()}),
            table_name => 'session',
        );
    $app;
}
