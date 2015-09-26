#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(text => 'Perl running on appengine!');
};

app->start;