package Piki::Web::Controller::Root;
use Piki::Utils;

sub auto {
    my $accounts = model->search('account');
    my $pages = model->search('page');
    +{ accounts => $accounts, pages => $pages }
}

sub get_index {}

sub post_create_page {
    model->insert(page => {
        name => p->{name},
    });

    +{ template => "create_data" };
}

sub post_create_account {
    model->insert(account => {
        name     => p->{name},
        password => p->{password},
    });

    +{ template => "create_data" };
}

sub post_login {
    my $ac = model->single(account => {
        name     => p->{name},
        password => p->{password},
    });

    if ($ac) {
        session->set(account => $ac->get_columns);
        +{result => "ログインしました"};
    }
    else {
        +{result => "ログインに失敗しました"};
    }
}

sub get_logout {
    session->expire;
}

sub get_not_found {
    +{ error => "ページが見つかりません" }
}

1;
