package Piki::Web::Handler;
use Piki::Utils;
use Piki::Web::Router;
use Plack::Request;
use Plack::Response;
use Plack::Session;

sub handler {
    my ($class, $env) = @_;

    my $rule = approuter->{router}->match($env);
    $rule = {
        controller => 'Root',
        action => 'not_found',
        %$rule,
    };

    session(Plack::Session->new($env));

    my $req = Plack::Request->new($env);
    my $controller = "Piki::Web::Controller::" . $rule->{controller};
    my $action = $rule->{action};

    my $params = +{ %$rule, %{$req->parameters} };
    p($params);
    $params = +{ %{$controller->auto($params)}, %$params } if $controller->can('auto');

    my $action_ref = $controller->can(lc($req->method) . "_" . $action);
    my $action_res = $controller->$action_ref;
    $action_res = ref $action_res eq 'HASH' ? $action_res : {};
    $params = +{ %$action_res, %$params };
    p($params);

    my $template;
    if ($rule->{controller} eq 'Root') {
        $template = lc($action_res->{template} or $action);
    }
    else {
        $template = lc($rule->{controller} . "/" . ($action_res->{template} or $action));
    }
    $template .= ".mt";
    my $body = mtf->render_file($template)->as_string;
    $body = utf->encode($body);

    my $res = $action_res;
    $res = $req->new_response(200);
    $res->content_type('text/html');
    $res->content($body);
    $res->finalize;
}

1;
