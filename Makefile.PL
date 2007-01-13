use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

my @classes = qw( Address Datebook Mail Memo PDB Raw StdAppInfo ToDo );

WriteMakefile(
    'NAME'			=> 'Palm',
    'VERSION'		=> '1.006',
    'LICENSE'       => 'Perl',
    'DISTNAME'		=> 'p5-Palm',	# More descriptive than just "Palm"

	'PREREQ_PM'		=> {
		'Test::More'	=> '0',
		},

	'PM'           => {
		map { ( "lib/$_.pm", "\$(INST_LIBDIR)/Palm/$_.pm" ) } @classes
		},

	'MAN3PODS'     => {
		map { ( "lib/$_.pm", "\$(INST_MAN3DIR)/Palm::$_.3" ) } @classes
		},

    'EXE_FILES'		=> [ 'examples/pdbdump' ],

	clean  => { FILES    => q|*.bak p5-*| },

);
