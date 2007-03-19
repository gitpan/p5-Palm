use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

my @classes = qw( 
	Address Datebook DateTime Mail 
	Memo PDB Raw StdAppInfo ToDo 
	ZirePhoto
	);

WriteMakefile(
    'NAME'			=> 'Palm',
	'ABSTRACT'		=> 'Module for handling PalmOS databases',
    'VERSION'		=> '1.008',
    'LICENSE'       => 'perl',
    'DISTNAME'		=> 'p5-Palm',	# More descriptive than just "Palm"
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'		=> {
		'Test::More'	=> '0',
		},

	'PM'           => {
		'lib/Palm.pm' => '$(INST_LIBDIR)/Palm.pm',
		map { ( "lib/$_.pm", "\$(INST_LIBDIR)/Palm/$_.pm" ) } @classes
		},

	'MAN3PODS'     => {
		'lib/Palm.pm' => '$(INST_MAN3DIR)/Palm.3',
		map { ( "lib/$_.pm", "\$(INST_MAN3DIR)/Palm::$_.3" ) } @classes
		},

    'EXE_FILES'		=> [ 'examples/pdbdump' ],

	clean  => { FILES    => q|*.bak p5-*| },

);
