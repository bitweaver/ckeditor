<?php
global $gBitSystem, $gBitSmarty, $gBitThemes;

$registerHash = array(
	'package_name' => 'ckeditor',
	'package_path' => dirname( __FILE__ ).'/',
);

$gBitSystem->registerPackage( $registerHash );

// Add our plugin directory.
$gBitSmarty->plugins_dir[] = $registerHash['package_path']."smarty";

if( $gBitSystem->isPackageActive( 'ckeditor' ) && $gBitUser->hasPermission( 'p_liberty_enter_html' ) ){
	if( defined( 'IS_LIVE' ) && IS_LIVE ) {
		$gBitThemes->loadJavascript( CKEDITOR_PKG_PATH.'ckeditor.js', FALSE, 600, FALSE );
	} else {
		$gBitThemes->loadJavascript( CKEDITOR_PKG_PATH.'ckeditor_source.js', FALSE, 600, FALSE );
	}
}

?>
