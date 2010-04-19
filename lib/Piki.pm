package Piki;
use Piki::ConfigLoader;
use Piki::Model;
use Piki::Utils;
use Piki::Web::Router;
use Encode qw/find_encoding/;

our ($config, $model, $p, $approuter, $utf, $mtf, $session);

sub setup {
    Piki::Utils->setup_home;
    $config = {%$config, %{Piki::ConfigLoader->load_config}};
    $utf = find_encoding('utf-8');
    Piki::Model->connect_info(config->{dsn});
    $model = Piki::Model->new;
    $mtf = Piki::Web::View::TMT->new(
        include_path => [
            config->{home} . 'template',
            config->{home} . 'template/include',
        ],
    );
    $approuter = Piki::Web::Router->new;
}

1;
