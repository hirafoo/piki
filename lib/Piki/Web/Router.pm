package Piki::Web::Router;
use Piki::Utils;
use Router::Simple;
use Router::Simple::Declare;

sub new {
    my $class = shift;

    my $router = route();
    bless { router => $router }, $class;
}

sub route {
    router {
        connect '/',
            { controller => 'Root', action => 'index' }, { method => 'GET' };
        connect '/create_page',
            { controller => 'Root', action => 'create_page' }, { method => 'POST' };
        connect '/create_account',
            { controller => 'Root', action => 'create_account' }, { method => 'POST' };
        connect '/login',
            { controller => 'Root', action => 'login' }, { method => 'POST' };
        connect '/logout',
            { controller => 'Root', action => 'logout' }, { method => 'GET' };

        connect '/page/{name:[^/]+$}',
            { controller => 'Page', action => 'show' }, { method => 'GET' };
        connect '/page/edit/{name:\S+$}',
            { controller => 'Page', action => 'edit' }, { method => 'GET' };
        connect '/page/edit/{name:\S+$}',
            { controller => 'Page', action => 'edit' }, { method => 'POST' };
    };
}

1;
