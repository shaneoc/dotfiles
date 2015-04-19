use strict;
use warnings;
use Irssi;

# TODO: is it better to use the "window activity" signal to notice messages?

sub send_message
{
    my ($message) = @_;
    my $socket_filename = "$ENV{HOME}/.thursday-events";

    if (-e $socket_filename) {
        system("sc", "msgsock", "send", $socket_filename, $message);
    }
}

# Signals are defined in /usr/share/doc/irssi/signals.txt.gz
sub sig_message_public
{
    my ($server, $msg, $nick, $address, $target) = @_;

    if (index(lc($msg), "shane") != -1) {
        send_message('mention');
    }
    else {
        send_message('message');
    }
}
Irssi::signal_add('message public', \&sig_message_public);

sub sig_message_private
{
    my ($server, $msg, $nick, $address) = @_;
    send_message('private-message');
}
Irssi::signal_add('message private', \&sig_message_private);

sub sig_send_text
{
    my ($line, $server, $witem) = @_;
    send_message('send-text');
}
Irssi::signal_add('send text', \&sig_send_text);

