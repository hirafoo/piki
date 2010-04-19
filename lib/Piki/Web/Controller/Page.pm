package Piki::Web::Controller::Page;
use Piki::Utils;

sub auto {
    my $accounts = model->search('account');
    my $pages = model->search('page');
    +{ accounts => $accounts, pages => $pages }
}

sub get_show {
    my $page = model->single(page => {name => p->{name}} );
    #todo: when not exist $page
    my $content = encoded_string(parse_hatena($page->content));
    +{ content => $content, name => $page->name }
}

sub get_edit {
    session->get('account') or return +{ template => "error", error => "ログインしてください" };
    my $page = model->single(page => {name => p->{name}} );
    #todo: when not exist $page
    my $content = $page->content;
    +{ content => $content, name => $page->name }
}

sub post_edit {
    session->get('account') or return +{ template => "error", error => "ログインしてください" };
    my $page = model->single(page => {name => p->{name}} );
    my $content = p->{content};
    $page->update({content => $content});
    +{ content => $content, name => $page->name, template => "create_data" }
}

1;
