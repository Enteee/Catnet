#!/usr/bin/perl
use WWW::Mechanize;

$mech = WWW::Mechanize->new();
$mech->stack_depth(0);

$RAND_THRESHOLD=0.05;
$|=1;
$pid = $$;
while (<>) {
    if( rand() < $RAND_THRESHOLD) {
        chomp;
        my @X = split;
        my $url = $X[0];
        if( $url =~ /(.+\.(jpg|png|gif))/i ){
            my $img = $1;
            my $type = $2;
            my $caturl = "http://thecatapi.com/api/images/get?format=src&size=small&type=$type";
            my $resp;
            do {
                $resp = $mech->simple_request( HTTP::Request->new(GET => "$caturl") );
            } while ( ! $resp->is_redirect );
            my $location = $resp->header( "Location" );
            my $uri = new URI( $location );
            print "OK rewrite-url=\"$uri\"\n";
            exit;
        }
    }
    print "OK\n";
}
