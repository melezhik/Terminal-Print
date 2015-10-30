use Terminal::Print;
use Terminal::ANSIColor;
my @colors = <red magenta yellow white>;

my $b = Terminal::Print.new;

$b.initialize-screen;

my @hearts;
#for $b.grep-grid({$^x %% 3 && $^y}) -> [$x,$y] {
for $b.grid-indices.pick(*) -> [$x,$y] {
    next unless $x %% 3;
    $b[$x][$y] = colored('♥', @colors.roll);
    $b.print-cell($x,$y);
    # $b[$x][$y] ='♥';
    push @hearts, [$x,$y];
}

sleep 5;

$b.clear-screen;

$b.clone-grid(0,'hearts');

my $hg := $b.grid-object('hearts');

#$hg.grep-grid: {$^x %% 3 and $^y %% 3 || $x %% 2 and $y %% 2}, :o;

my $og := $b.grid-object(0);
my $h3 := $b.clone-grid(0,'h3');

$h3.grep-grid: {$^x == 21 || $^y == 12}, :o;

sleep 5;

$b.blit(0);
sleep 1;
$b.blit('h3');
sleep 1;
$b.blit('hearts');
sleep 1;
$b.blit(0);
sleep 1;
$b.blit('h3');
sleep 1;


LEAVE { $b.shutdown-screen }
