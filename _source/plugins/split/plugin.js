/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @file Content Split Marker
 */

// Register a plugin named "split".
CKEDITOR.plugins.add( 'split',
{
	init : function( editor )
	{
		// Register the command.
		editor.addCommand( 'split', CKEDITOR.plugins.splitCmd );

		// Register the toolbar button.
		editor.ui.addButton( 'Split',
			{
				label : editor.lang.split,
				command : 'split'
			});

		// Add the style that renders our placeholder.
		editor.addCss(
			'img.cke_split' +
			'{' +
				'background-image: url(' + CKEDITOR.getUrl( this.path + 'images/split.gif' ) + ');' +
				'background-position: center center;' +
				'background-repeat: no-repeat;' +
				'clear: both;' +
				'display: block;' +
				'float: none;' +
				'width:100%;_width:99.9%;' +
				'border-top: #999999 1px dotted;' +
				'border-bottom: #999999 1px dotted;' +
				'height: 5px;' +
				'page-break-after: always;' +

			'}' );
	},

	afterInit : function( editor )
	{
		// Register a filter to displaying placeholders after mode change.

		var dataProcessor = editor.dataProcessor,
			dataFilter = dataProcessor && dataProcessor.dataFilter;

		if ( dataFilter )
		{
			dataFilter.addRules(
				{
					elements :
					{
						div : function( element )
						{
							var attributes = element.attributes,
								style = attributes && attributes.style,
								child = style && element.children.length == 1 && element.children[ 0 ],
								childStyle = child && ( child.name == 'span' ) && child.attributes.style;

							if ( childStyle && ( /page-break-after\s*:\s*always/i ).test( style ) && ( /display\s*:\s*none/i ).test( childStyle ) )
								return editor.createFakeParserElement( element, 'cke_split', 'div' );
						}
					}
				});
		}
	},

	requires : [ 'fakeobjects' ]
});

CKEDITOR.plugins.splitCmd =
{
	exec : function( editor )
	{
		// Create the element that represents a print break.
		var breakObject = CKEDITOR.dom.element.createFromHtml( '<div style="page-break-after: always;"><span style="display: none;">&nbsp;</span></div>...split...' );

		// Creates the fake image used for this element.
		breakObject = editor.createFakeElement( breakObject, 'cke_split', 'div' );

		var ranges = editor.getSelection().getRanges();

		editor.fire( 'saveSnapshot' );

		for ( var range, i = 0 ; i < ranges.length ; i++ )
		{
			range = ranges[ i ];

			if ( i > 0 )
				breakObject = breakObject.clone( true );

			range.splitBlock( 'p' );
			range.insertNode( breakObject );
			if ( i == ranges.length - 1 )
			{
				range.moveToPosition( breakObject, CKEDITOR.POSITION_AFTER_END );
				range.select();
			}
		}

		editor.fire( 'saveSnapshot' );
	}
};
