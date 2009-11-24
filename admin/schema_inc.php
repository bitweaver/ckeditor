<?php
global $gBitInstaller;
$gBitInstaller->registerPackageInfo( CKEDITOR_PKG_NAME, array(
	'description' => "CKEditor is a 'What You See Is What You Get' textarea HTML editor. It works with IE 5.5+, Firefox 1.0+, Mozilla 1.3+, and Netscape 7+. ",
	'license' => '<a href="http://www.gnu.org/licenses/licenses.html#LGPL">LGPL</a>',
	'important' => 'When using this WYSIWYG editor, we recommend that you either use HTML as the only content format or use TikiWiki with the option <kbd>allow HTML</kbd> enabled (formats are set in Administration --> Liberty --> Liberty plugins). It <em>can not</em> be used with competing editor TinyMCE active, and it is largely incompatible with the package Quicktags.',
	'version' => '2.6+',
) );

$gBitInstaller->registerPreferences( CKEDITOR_PKG_NAME, array(
	array(CKEDITOR_PKG_NAME,'ckeditor_debug','n'),
	array(CKEDITOR_PKG_NAME,'ckeditor_toolbars', 'Bitweaver'),
) );

?>
