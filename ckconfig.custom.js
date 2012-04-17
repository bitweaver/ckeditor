// $header$

CKEDITOR.editorConfig = function( config ) {

/* Start of BITWEAVER toolbar sets */
config.toolbar_Supported = [
	['Source','-','Preview'],
	['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print','SpellChecker'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['NumberedList','BulletedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	['Link','Unlink','Anchor'],
	['Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	'/',
	['Styles','Format','Font','FontSize'],
	['TextColor','BGColor'],
	['Maximize','ShowBlocks','-','About']
];

config.toolbar_Beginner = [
	['Bold','Italic','Underline'],
	['NumberedList','BulletedList'],
	['Link','Unlink','Anchor'],
	['Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	['Maximize','-','About']
];

config.toolbar_Intermediate = [
	['Cut','Copy','Paste','PasteText','PasteFromWord'],
	['Undo','Redo','-','Find','Replace','-','SelectAll'],
	'/',
	['Bold','Italic','Underline'],
	['NumberedList','BulletedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	['Link','Unlink','Anchor'],
	['Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	'/',
	['TextColor','BGColor'],
	['Maximize','-','About']
];

config.toolbar_Advanced = [
    ['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    ['Link','Unlink','Anchor'],
    ['Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    '/',
	['Source','-','Preview'],
  	['Cut','Copy','Paste','PasteText','PasteFromWord'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['SpellCheck'],
	'/',
	['Styles','Format','Font','FontSize'],
	['TextColor','BGColor'],
	['Maximize','ShowBlocks','-','About']
];

// to add split plugin add this to array of tools in your selected ToolbarSet
//	['Split']
// to add attachment plugin add this to array of tools in your selected ToolbarSet
//	['Attachment']

/* END of BITWEAVER toolbar sets */

//Enable additional plugins from the bw library of addons
//config.extraPlugins = 'split';

// Lock resize function to bitweaver window.
config.resize_minHeight = 300;	
config.resize_dir = 'vertical';

}; // End CKEDITOR.editorConfig function
