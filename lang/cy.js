﻿/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

/**
 * @fileOverview Defines the {@link CKEDITOR.lang} object, for the
 * Welsh language.
 */

/**#@+
   @type String
   @example
*/

/**
 * Contains the dictionary of language entries.
 * @namespace
 */
CKEDITOR.lang[ 'cy' ] = {
	/**
	 * The language reading direction. Possible values are "rtl" for
	 * Right-To-Left languages (like Arabic) and "ltr" for Left-To-Right
	 * languages (like English).
	 * @default 'ltr'
	 */
	dir: 'ltr',

	// ARIA description.
	editor: 'Golygydd Testun Cyfoethog',

	// Common messages and labels.
	common: {
		// Screenreader titles. Please note that screenreaders are not always capable
		// of reading non-English words. So be careful while translating it.
		editorHelp: 'Gwasgwch ALT 0 am gymorth',

		browseServer: 'Pori\'r Gweinydd',
		url: 'URL',
		protocol: 'Protocol',
		upload: 'Lanlwytho',
		uploadSubmit: 'Anfon i\'r Gweinydd',
		image: 'Delwedd',
		flash: 'Flash',
		form: 'Ffurflen',
		checkbox: 'Blwch ticio',
		radio: 'Botwm Radio',
		textField: 'Maes Testun',
		textarea: 'Ardal Testun',
		hiddenField: 'Maes Cudd',
		button: 'Botwm',
		select: 'Maes Dewis',
		imageButton: 'Botwm Delwedd',
		notSet: '<heb osod>',
		id: 'Id',
		name: 'Name',
		langDir: 'Cyfeiriad Iaith',
		langDirLtr: 'Chwith i\'r Dde (LTR)',
		langDirRtl: 'Dde i\'r Chwith (RTL)',
		langCode: 'Cod Iaith',
		longDescr: 'URL Disgrifiad Hir',
		cssClass: 'Dosbarth Dalen Arddull',
		advisoryTitle: 'Teitl Cynghorol',
		cssStyle: 'Arddull',
		ok: 'Iawn',
		cancel: 'Diddymu',
		close: 'Cau',
		preview: 'Rhagolwg',
		resize: 'Llusgo i ailfeintio',
		generalTab: 'Cyffredinol',
		advancedTab: 'Uwch',
		validateNumberFailed: 'Nid yw\'r gwerth hwn yn rhif.',
		confirmNewPage: 'Byddwch yn colli unrhyw newidiadau i\'r cynnwys sydd heb eu cadw. A ydych am barhau i lwytho tudalen newydd?',
		confirmCancel: 'Mae rhai o\'r opsiynau wedi\'u newid. A ydych wir am gau\'r deialog?',
		options: 'Opsiynau',
		target: 'Targed',
		targetNew: 'Ffenest Newydd (_blank)',
		targetTop: 'Ffenest ar y Brig (_top)',
		targetSelf: 'Yr un Ffenest (_self)',
		targetParent: 'Ffenest y Rhiant (_parent)',
		langDirLTR: 'Chwith i\'r Dde (LTR)',
		langDirRTL: 'Dde i\'r Chwith (RTL)',
		styles: 'Arddull',
		cssClasses: 'Dosbarthiadau Ffeil Ddiwyg',
		width: 'Lled',
		height: 'Uchder',
		align: 'Alinio',
		alignLeft: 'Chwith',
		alignRight: 'Dde',
		alignCenter: 'Canol',
		alignTop: 'Brig',
		alignMiddle: 'Canol',
		alignBottom: 'Gwaelod',
		invalidValue	: 'Gwerth annilys.',
		invalidHeight: 'Rhaid i\'r Uchder fod yn rhif.',
		invalidWidth: 'Rhaid i\'r Lled fod yn rhif.',
		invalidCssLength: 'Mae\'n rhaid i\'r gwerth ar gyfer maes "%1" fod yn rhif positif gyda neu heb uned fesuriad CSS dilys (px, %, in, cm, mm, em, ex, pt, neu pc).',
		invalidHtmlLength: 'Mae\'n rhaid i\'r gwerth ar gyfer maes "%1" fod yn rhif positif gyda neu heb uned fesuriad HTML dilys (px neu %).',
		invalidInlineStyle: 'Mae\'n rhaid i\'r gwerth ar gyfer arddull mewn-llinell gynnwys un set neu fwy ar y fformat "enw:gwerth", wedi\'u gwahanu gyda hanner colon.',
		cssLengthTooltip: 'Rhowch rif ar gyfer gwerth mewn picsel neu rhif gydag uned CSS dilys (px, %, in, cm, mm, em, pt neu pc).',

		// Put the voice-only part of the label in the span.
		unavailable: '%1<span class="cke_accessibility">, ddim ar gael</span>'
	}
};
