use Test::More tests => 60;

use warnings;
use strict;

use PDF::API2;

my $pdf = PDF::API2->new();

ok($pdf->can('new'),'can new');
ok($pdf->can('open'),'can open');
ok($pdf->can('openScalar'),'can openScalar');
ok($pdf->can('preferences'),'can preferences');
ok($pdf->can('default'),'can default');
ok($pdf->can('isEncrypted'),'can isEncrypted');
ok($pdf->can('info'),'can info');
ok($pdf->can('infoMetaAttributes'),'can infoMetaAttributes');
ok($pdf->can('xmpMetadata'),'can xmpMetadata');
ok($pdf->can('pageLabel'),'can pageLabel');
ok($pdf->can('finishobjects'),'can finishobjects');
ok($pdf->can('proc_pages'),'can proc_pages');
ok($pdf->can('update'),'can update');
ok($pdf->can('saveas'),'can saveas');
ok($pdf->can('save'),'can save');
ok($pdf->can('stringify'),'can stringify');
ok($pdf->can('release'),'can release');
ok($pdf->can('end'),'can end');
ok($pdf->can('page'),'can page');
ok($pdf->can('openpage'),'can openpage');
ok($pdf->can('walk_obj'),'can walk_obj');
ok($pdf->can('importPageIntoForm'),'can importPageIntoForm');
ok($pdf->can('importpage'),'can importpage');
ok($pdf->can('pages'),'can pages');
ok($pdf->can('mediabox'),'can mediabox');
ok($pdf->can('cropbox'),'can cropbox');
ok($pdf->can('bleedbox'),'can bleedbox');
ok($pdf->can('trimbox'),'can trimbox');
ok($pdf->can('artbox'),'can artbox');
ok($pdf->can('addFontDirs'),'can addFontDirs');
ok($pdf->can('corefont'),'can corefont');
ok($pdf->can('psfont'),'can psfont');
ok($pdf->can('ttfont'),'can ttfont');
ok($pdf->can('cjkfont'),'can cjkfont');
ok($pdf->can('synfont'),'can synfont');
ok($pdf->can('bdfont'),'can bdfont');
ok($pdf->can('unifont'),'can unifont');
ok($pdf->can('image_jpeg'),'can image_jpeg');
ok($pdf->can('image_tiff'),'can image_tiff');
ok($pdf->can('image_pnm'),'can image_pnm');
ok($pdf->can('image_png'),'can image_png');
ok($pdf->can('image_gif'),'can image_gif');
ok($pdf->can('image_gd'),'can image_gd');
ok($pdf->can('colorspace_act'),'can colorspace_act');
ok($pdf->can('colorspace_web'),'can colorspace_web');
ok($pdf->can('colorspace_hue'),'can colorspace_hue');
ok($pdf->can('colorspace_separation'),'can colorspace_separation');
ok($pdf->can('colorspace_devicen'),'can colorspace_devicen');
ok($pdf->can('xo_code128'),'can xo_code128');
ok($pdf->can('xo_codabar'),'can xo_codabar');
ok($pdf->can('xo_2of5int'),'can xo_2of5int');
ok($pdf->can('xo_3of9'),'can xo_3of9');
ok($pdf->can('xo_ean13'),'can xo_ean13');
ok($pdf->can('xo_form'),'can xo_form');
ok($pdf->can('egstate'),'can egstate');
ok($pdf->can('pattern'),'can pattern');
ok($pdf->can('shading'),'can shading');
ok($pdf->can('outlines'),'can outlines');
ok($pdf->can('named_destination'),'can named_destination');
ok($pdf->can('resource'),'can resource');