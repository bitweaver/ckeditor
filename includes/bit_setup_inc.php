<?php
global $gBitSystem, $gBitThemes;

$registerHash = array(
	'package_name' => 'ckeditor',
	'package_path' => dirname( dirname( __FILE__ ) ).'/',
);

$gBitSystem->registerPackage( $registerHash );

function loadCkEditor() {
	global $gBitSystem, $gBitThemes, $gBitUser;
	if( $gBitSystem->isPackageActive( 'ckeditor' ) && $gBitUser->hasPermission( 'p_liberty_enter_html' ) ){
		// same files for now... should choose between .min files
		if( defined( 'IS_LIVE' ) && IS_LIVE ) {
			$jsDir = (file_exists( CONFIG_PKG_PATH.'externals/ckeditor/ckeditor.js' ) ? CONFIG_PKG_PATH.'externals/ckeditor/' : CKEDITOR_PKG_PATH.'ckeditor/');
			$gBitThemes->loadJavascript( $jsDir.'ckeditor.js', FALSE, 600, FALSE );
			$gBitThemes->loadJavascript( $jsDir.'adapters/jquery.js', FALSE, 600, FALSE );
		} else {
			$jsDir = (file_exists( CONFIG_PKG_PATH.'externals/ckeditor/ckeditor.js' ) ? CONFIG_PKG_PATH.'externals/ckeditor/' : CKEDITOR_PKG_PATH.'ckeditor/');
			$gBitThemes->loadJavascript( $jsDir.'ckeditor.js', FALSE, 600, FALSE );
			$gBitThemes->loadJavascript( $jsDir.'adapters/jquery.js', FALSE, 600, FALSE );
		}
	}
}
