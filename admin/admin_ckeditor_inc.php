<?php

$formCkeditorFeatures = array(
	"ckeditor_custom_config" => array(
		'label' => 'Custom Config File',
		'note' => 'If enabled, a custom configuration is included, either <kbd>' . THEMES_PKG_DIR . '/styles/&lt;current-style&gt;/ckeditor/ckconfig.custom.js</kbd>, or <kbd>' . CKEDITOR_PKG_DIR . '/ckconfig.custom.js</kbd>. It may be a modified copy of <kbd>ckconfig.js</kbd> or of <kbd>ckconfig.bitweaver.js</kbd>. Depending on the modifications, a few of the settings below might not work anymore as expected (e.g., toolbar or skin settings).'
	),
	"ckeditor_debug" => array(
		'label' => 'Enabled debugging',
		'note' => 'Enable support for debug message output. On first debug message a window will pop up.'
	),
	"ckeditor_on_click" => array(
		'label' => 'Load CKEditor on Click',
		'note' => 'Delay loading the CKEditor until the user clicks on the text area.'
	),
	"ckeditor_ask" => array(
		'label' => 'Ask to use CKEditor',
		'note' => 'If set the user will be prompted if they want to use CKEditor for a given textbox. This option implies Load CKEditor on Click even if it is not set.'
	),
);


// Toolbars

$gBitSmarty->assign( 'formCkeditorFeatures', $formCkeditorFeatures );

$formToolbars = array( 'ckedit_toolbars' => array(
		'label' => 'Toolbar Set',
		'note' => 'The toolbar set to use. "All" includes functionality not supported by Bitweaver. Use at your own risk!'
		)
);

$gBitSmarty->assign( 'formToolbars', $formToolbars );
$gBitSmarty->assign( 'formToolbarChoices', array('Basic', 'Beginner', 'Intermediate', 'Advanced', 'Supported', 'All'));


// Skin 

$formSkin = array( 'ckedit_skin' => array(
		'label' => 'Skin',
		'note' => 'The skin to use.',
		)
);
$gBitSmarty->assign( 'formSkin', $formSkin );
$gBitSmarty->assign( 'formSkinChoices', array('default', 'silver', 'office2003'));


if( !empty( $_REQUEST['change_prefs'] ) ) {
	foreach( $formCkeditorFeatures as $item => $data ) {
		simple_set_toggle( $item, CKEDITOR_PKG_NAME );
	}

	$ckeditorSets = array_merge( $formToolbars , $formSkin);
	foreach( $ckeditorSets as $item => $data ) {
		simple_set_value( $item, CKEDITOR_PKG_NAME );
	}
}
?>
