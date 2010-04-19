package Piki::Utils;
use base qw/Exporter/;
use strict;
use warnings;
use Piki;
use Config::Pit;
use Data::Dumper;
use Path::Class;
use Path::Class::Dir;
use Path::Class::File;
use Text::Hatena;
use Time::Piece;

our @EXPORT = qw/
    config model mtf utf p approuter session
    env pp say now ymd_hms parse_hatena parse_dt dbi_config encoded_string
/;

sub import {
    strict->import;
    warnings->import;
    __PACKAGE__->export_to_level(1, @_);
}

sub config { $Piki::config }
sub model { $Piki::model }
sub utf { $Piki::utf }
sub mtf { $Piki::mtf }
sub approuter { $Piki::approuter }
sub p { # parameters
    my $p = shift;
    $p ? ($Piki::p = $p) : $Piki::p
}
sub session { 
    my $s = shift;
    $s ? ($Piki::session = $s) : $Piki::session 
}

sub dbi_config {
    [
        config->{dsn}->{dsn},
        config->{dsn}->{username},
        config->{dsn}->{password},
        {
            RaiseError => 1,
            AutoCommit => 1,
        }
    ]
}

sub pp {
    local $Data::Dumper::Indent = 1;
    local $Data::Dumper::Terse  = 1;
    warn Dumper shift;
    my @c = caller;
    print STDERR "  at $c[1]:$c[2]\n\n";
}

sub say { print @_, "\n" }

sub now { localtime }

sub ymd_hms { my $t = localtime; join " ", $t->ymd, $t->hms }

sub parse_hatena { Text::Hatena->parse(shift) }

sub parse_dt { Time::Piece->strptime(shift, '%Y-%m-%d %H:%M:%S') }

sub encoded_string { Text::MicroTemplate::encoded_string(shift) }

sub setup_home {
    my $caller = caller(0);
    my $dist = $INC{"$caller.pm"};
    $Piki::config->{home} = dir($dist)->parent->parent->absolute->stringify . '/';
}

sub path_to {
    my @path = @_;
    my $path = Path::Class::Dir->new(config->{home}, @path);
    return $path if -d $path;
    return Path::Class::File->new(config->{home}, @path);
}

sub env { $ENV{PIKI_ENV} || 'development' }

1;
