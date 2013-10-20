package Dist::Zilla::PluginBundle::FFFINKEL;
BEGIN {
  $Dist::Zilla::PluginBundle::FFFINKEL::AUTHORITY = 'cpan:FFFINKEL';
}
{
  $Dist::Zilla::PluginBundle::FFFINKEL::VERSION = '0.004';
}

# ABSTRACT: My Dist::Zilla plugin bundle

use Moose;
use namespace::autoclean;
with qw/ Dist::Zilla::Role::PluginBundle::Easy /;


sub configure {
	my ($self) = @_;

	$self->add_bundle(
		'@Filter',
		{
			'-bundle' => '@Basic',
			'-remove' => [ 'ShareDir' ],
		}
	);

	$self->add_plugins( [ 'Git::NextVersion', { first_version => 0.001 } ] );
	$self->add_plugins('PkgVersion');
	$self->add_plugins( [ 'Authority', { authority => 'cpan:FFFINKEL', } ] );
	$self->add_plugins('ChangelogFromGit');

	$self->add_plugins(
		qw/
			PodWeaver
			AutoPrereqs
			Clean
			/
	);

	$self->add_plugins(
		qw/
		  EOLTests
		  PodSyntaxTests
		  PodCoverageTests
		  Git::Check
		  /
	);

	$self->add_bundle(
		'@Git',
		{
			push_to => 'origin',
			push_to => 'github',
		}
	);

	$self->add_plugins('Twitter');

	#=pod
	#
	#TODO
	#
	#  [MetaJSON]
	#  [MetaConfig]
	#  [MetaResources]
	#  repository.type   = git
	#  repository.url    =
	#  http://git.mfinkel.net/cpan/${lowercase_dist}
	#  repository.web    =
	#  http://github.com/rafl/${lowercase_dist}
	#  bugtracker.web    =
	#  http://rt.cpan.org/Public/Dist/Display.html?Name=${dist}
	#  bugtracker.mailto = bug-${dist}@rt.cpan.org
	#  homepage          =
	#  http://metacpan.org/release/${dist}
	#
	#=cut
	#
	#	$self->add_plugins('MetaJSON');
	#	$self->add_plugins('MetaConfig');
	#	$self->add_plugins('MetaResources', {
	#		'repository.type' => 'git',
	#		'repository.url' =>
	#		'git@github.com:fffinkel/${lowercase_dist}',
	#		'repository.web' =>
	#		'http://github.com/fffinkel/${lowercase_dist}',
	#		'bugtracker.web' =>
	#		'http://rt.cpan.org/Public/Dist/Display.html?Name=${dist}',
	#		'bugtracker.mailto' => 'bug-${dist}@rt.cpan.org',
	#		'homepage' =>
	#		'http://metacpan.org/release/${dist}',
	#	});

}


__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Dist::Zilla::PluginBundle::FFFINKEL - My Dist::Zilla plugin bundle

=head1 VERSION

version 0.004

=head1 SYNOPSIS

  [@FFFINKEL]

=head1 DESCRIPTION

  [@Filter]
  -bundle = @Basic
  -remove = ShareDir

  [Git::NextVersion]
  first_version = 0.001
  [PkgVersion]
  [Authority]
  authority = cpan:FFFINKEL
  [ChangelogFromGit]

  [PodWeaver]
  [AutoPrereqs]
  [Clean]

  [EOLTests]
  [PodSyntaxTests]
  [PodCoverageTests]
  [Git::Check]

  [@Git]
  push_to = origin
  push_to = github

  [Twitter]

=head1 NAME

Dist::Zilla::PluginBundle::FFFINKEL - My Dist::Zilla plugin bundle

=head1 METHODS

=head2 configure

Bundle configuration method, see
L<Dist::Zilla::PluginBundle::Easy/"DESCRIPTION">

=head1 AUTHOR

Matt Finkel <fffinkel@cpan.org>

=head1 SEE ALSO

L<Dist::Zilla::Role::PluginBundle::Easy> L<Dist::Zilla::PluginBundle::RJBS>

=head1 AUTHOR

Matt Finkel <fffinkel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Matt Finkel.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
