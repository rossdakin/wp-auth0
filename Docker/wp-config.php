<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'j##@:miHG^}CBm90^AU*WBgE?f:Q(,@(H[EW8u+ys{4R`jJ~RF)m5a>C-Y+@dK-W');
define('SECURE_AUTH_KEY',  'ih@s9q,m!7gaR/,{m1nH6j|G@[C-[^zrAC_A=,+]+@ePFbgw{K6opq,%aybD|W}g');
define('LOGGED_IN_KEY',    ' Wa|%klfPit<aC(}$vBD~yQE%+wMF[-?.r+~~o/0<v]f|_pmM::HNwpt{J~b#*Wl');
define('NONCE_KEY',        'W{.>OL_I_/,=)|nO||w!N}ey-=6@0(-+c^c+!DH&mWCBDfG6[o_bn&W`F2.7J,K>');
define('AUTH_SALT',        'WAQb8)V8$[>d~Q4=4F )&qPtp[B2I[k8Kmw[OG{*2HeU9lV^n?,(=g3/90vleKLB');
define('SECURE_AUTH_SALT', 'y<$O*Do?9A}bp&.W0/A3%o29]I+tc8G#|`La+%ir7i#+^xeDn_ko<eLv,oMX%!)V');
define('LOGGED_IN_SALT',   'E]:kf*HV:rH.,/?/z/VCV1EJ[eiTjECQ< T`1@<PB?Sz$E-P3k&{|Wa5f2h{{<X7');
define('NONCE_SALT',       'ryuUgY)oJ u]aX[PYNp>gAGWm4USW%=gHQr2=n-3N1ecF:x+*6DfMRLjs*V 8m<t');

$table_prefix  = 'wp_';

ini_set( 'display_errors', 1 );
ini_set( 'display_startup_errors', 1 );
error_reporting( E_ALL );

define('WP_DEBUG', TRUE);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
