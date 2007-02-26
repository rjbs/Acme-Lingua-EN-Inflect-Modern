use Test::More tests => 1;

BEGIN {
  use_ok('Acme');
}

diag( "Testing Acme $Acme::VERSION" );
