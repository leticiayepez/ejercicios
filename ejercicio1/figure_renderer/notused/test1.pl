use strict;
use GD;
my $image = new GD::Image(101,101);
my $white = $image->colorAllocate(200,200,200);
my $red = $image->colorAllocate(255, 0, 0);  # Allocate red
my $parallelogram = new GD::Polygon;         # Create the polygon
$parallelogram->addPt(20, 0);                # Add the 4 vertices
$parallelogram->addPt(0, 100);
$parallelogram->addPt(80, 100);
$parallelogram->addPt(100, 0);
$image->polygon($parallelogram, $red);       # Draw the polygon
#print $image->png( );
open my $out, '>', 'img1.png' or die;
binmode $out;
print $out $image->png( );

