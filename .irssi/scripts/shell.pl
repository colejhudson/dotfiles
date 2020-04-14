use strict;
use Irssi;

sub message_channel {
  my ($witem, $message) = @_;
  return unless $witem and $message;

  my $command = "/msg $witem->{'name'} $message";
  
  $witem->window()->command($command);
}

Irssi::command_bind pubsh => sub {
  my ($argv, $server, $witem) = @_;
  return unless $witem;

  message_channel($witem, "\$ $argv");
  
  my @lines = split /\n/, `$argv`;
  foreach(@lines) {
    message_channel($witem, "| $_");
  }
};

Irssi::command_bind sh => sub {
  my ($argv, $server, $witem) = @_;
  return unless $witem;

  $witem->print("\$ $argv");
  
  my @lines = split /\n/, `$argv`;
  foreach(@lines) {
    $witem->print("| $_");
  }
};
