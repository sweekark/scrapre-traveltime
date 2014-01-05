#! /usr/bin/perl
use CGI qw(:standard);
use LWP::UserAgent;
use strict;

my($query, $www, $url, $duration);
my($s, $d)= @ARGV;

print "Content-type: text/html\n\n"; 

#ADDED BY CHANDRA, 1 Line
#print "\n\nSTART: script time is ->".localtime().", FOR LOCATION |$s| TO |$d|\n";

$query = new CGI;

my $s = $query->param('from');
my $d = $query->param('to');

$www= LWP::UserAgent->new();

if($s ne "" && $d ne "") {
    $url= "https://maps.google.co.in/maps?f=d&source=s_d&saddr=${s}&daddr=${d}";
    my $r= $www->get($url);
    my $c= $r->decoded_content();
    if($c =~ /<span>In current traffic: (.*?)<\/span>/) {
		$duration= $1;
    } elsif($c =~ /<div class="altroute-rcol altroute-info"> <span>.*?<\/span>, <span>(.*?)<\/span>/) {
		$duration= $1;
	}

    if($duration =~ /(\d+) hours (\d+) mins/)
	{
	my $hours= $1;
	my $mins= $2;

	my $seconds= eval(($hours * 60 * 60) + ($mins * 60));

	print "{</br>
	from:\"$s\"</br>
	to: \"$d\"</br>
	\"time\":$seconds</br>
	}";
	};

   # print "$duration\n";
} else {
    print "Please provide source and destination\n";
}


#ADDED BY CHANDRA, 1 Line
#print "END: script time is ->".localtime().", FOR LOCATOIN |$s| TO |$d| \n";
