#$Header$

package RT::Scrips;
use RT::EasySearch;
@ISA= qw(RT::EasySearch);


#instantiate a new object.
sub new {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self  = {};
  bless ($self, $class);
  $self->_Init(@_);
  return ($self)
}

sub _Init { 
  my $self = shift;
  $self->{'table'} = "Scrips";
  $self->{'primary_key'} = "id";
  $self->SUPER::_Init(@_);
}

sub Limit {
  my $self = shift;
  my %args = ( ENTRYAGGREGATOR => 'AND',
	       @_);
  $self->SUPER::Limit(%args);
}

sub NewItem {
  my $self = shift;
  my $item;

  use RT::Scrip;
  $item = new RT::Scrip($self->{'user'});
  return($item);
}


1;

