use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Acme::Lingua::EN::Inflect::Modern',
    AUTHOR              => 'Ricardo SIGNES <rjbs@cpan.org >',
    VERSION_FROM        => 'lib/Acme/Lingua/EN/Inflect/Modern.pm',
    ABSTRACT_FROM       => 'lib/Acme/Lingua/EN/Inflect/Modern.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Lingua::EN::Inflect' => 1.86,
        'Sub::Override'       => 0.07,
        'Test::More'          => 0,
    },
    (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Acme-Lingua-EN-Inflect-Modern-*' },
);
