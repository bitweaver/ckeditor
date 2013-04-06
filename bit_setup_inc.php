<?php
global $gBitSystem, $gBitThemes;

$registerHash = array(
	'package_name' => 'ckeditor',
	'package_path' => dirname( __FILE__ ).'/',
);

$gBitSystem->registerPackage( $registerHash );

if( $gBitSystem->isPackageActive( 'ckeditor' ) && $gBitUser->hasPermission( 'p_liberty_enter_html' ) ){
	if( defined( 'IS_LIVE' ) && IS_LIVE ) {
		$gBitThemes->loadJavascript( CKEDITOR_PKG_PATH.'ckeditor.js', FALSE, 600, FALSE );
	} else {
		$gBitThemes->loadJavascript( CKEDITOR_PKG_PATH.'ckeditor_source.js', FALSE, 600, FALSE );
	}
}

?>
