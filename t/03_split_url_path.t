use strict;
use warnings;

use Test::More 'no_plan';

use URL::XS;


subtest 'split regular url path' => sub {
    ok my $r = URL::XS::parse_url(
        'https://jack:password@localhost:8989/some/test/path/to/resource?query=yes&q=jack#fragment1'
    );
    is $r->{path}, 'some/test/path/to/resource', 'right url path';

    my $url_path = URL::XS::split_url_path($r->{path}, 10);

    is_deeply $url_path, ['some', 'test', 'path', 'to', 'resource'], 'right splited url path';
};

subtest 'split minimal url path' => sub {
    ok my $r = URL::XS::parse_url(
        'https://jack:password@localhost:8989/some/test/path/to/resource?query=yes&q=jack#fragment1'
    );
    is $r->{path}, 'some/test/path/to/resource', 'right url path';

    my $url_path = URL::XS::split_url_path($r->{path}, 10);

    is_deeply $url_path, ['some', 'test', 'path', 'to', 'resource'], 'right splited url path';
};

subtest 'split maximal url path' => sub {
    ok my $r = URL::XS::parse_url(
        'https://jack:password@localhost:8989/some/test/path/to/resource?query=yes&q=jack#fragment1'
    );
    is $r->{path}, 'some/test/path/to/resource', 'right url path';

    my $url_path = URL::XS::split_url_path($r->{path}, 10);

    is_deeply $url_path, ['some', 'test', 'path', 'to', 'resource'], 'right splited url path';
};

subtest 'split invalid url path' => sub {
    my $url_path = URL::XS::split_url_path('', 10);
    is_deeply $url_path, [], 'right splited url path';
};

done_testing;
