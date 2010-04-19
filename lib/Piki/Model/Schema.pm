package Piki::Model::Schema;
use DBIx::Skinny::Schema;
use Piki::Utils;

install_table page => schema {
    pk 'id';
    columns qw/id name content created_at updated_at/;
};

install_table account => schema {
    pk 'id';
    columns qw/id name password created_at updated_at/;
};

install_common_trigger pre_insert => sub {
    my ($self, $args, $table) = @_;
    $args->{created_at} = ymd_hms;
    $args->{updated_at} = ymd_hms;
};

install_common_trigger pre_update => sub {
    my ($self, $args, $table) = @_;
    $args->{updated_at} = ymd_hms;
};

install_inflate_rule '_at$' => callback {
    inflate { parse_dt(shift) };
};

install_inflate_rule '(name|content)' => callback {
    inflate { 
        my $column = shift;
        $column ? utf->decode($column) : '';
    };
};

1;
