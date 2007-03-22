use Test::More;
eval "use Test::Pod::Coverage 1.04";
plan skip_all => "Test::Pod::Coverage 1.04 required for skipping testing POD coverage" if $@;
plan skip_all => "these test's useless since doc's are elsewhere";
all_pod_coverage_ok();
