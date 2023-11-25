{if $gBitSystem->isPackageActive('ckeditor')}

<script>
{literal}
function createCkEditor( pTextAreaId ) {
	configCkEditor();
	if( !CKEDITOR.instances[pTextAreaId] ){
		$('#'+pTextAreaId).attr("contenteditable", true);
		//var config = {};
		//editor = CKEDITOR.appendTo( pTextAreaId, config, $('#'+pTextAreaId).html() );
		CKEDITOR.replace( pTextAreaId );
	}
}

function destroyCkEditor( pTextAreaId ) {
	$('#'+pTextAreaId).attr("contenteditable", true);
	if( CKEDITOR.instances[pTextAreaId] ){
		CKEDITOR.instances[pTextAreaId].destroy();

		// Retrieve the editor contents. In an Ajax application, this data would be
		// sent to the server or used in any other way.
		$('#'+pTextAreaId).innerHTML = html = CKEDITOR.instances[pTextAreaId].getData();

		// Destroy the editor.
		CKEDITOR.instances[pTextAreaId].destroy();
		CKEDITOR.instances[pTextAreaId] = null;
	}
}

function configCkEditor() {
	CKEDITOR.config.toolbarGroups = [
	{/literal}{if $gBitSystem->getConfig('ckedit_toolbars') eq 'Full'}{literal}
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'forms' },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'tools' },
		{ name: 'others' },
		{ name: 'about' }
	{/literal}{elseif $gBitSystem->getConfig('ckedit_toolbars') eq 'Advanced'}{literal}
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'forms' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] },
		'/',
		{ name: 'links' },
		{ name: 'insert' },
		'/',
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'tools' },
		{ name: 'others' },
		{ name: 'about' }
	{/literal}{elseif $gBitSystem->getConfig('ckedit_toolbars') eq 'Intermediate'}{literal}
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'forms' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		'/',
		{ name: 'links' },
		{ name: 'insert' },
		'/',
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'tools' },
		{ name: 'others' },
		{ name: 'about' }
	{/literal}{else}{literal}
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'links' }
	{/literal}{/if}{literal}
];
	CKEDITOR.config.autoParagraph = false;
}
{/literal}
</script>
{/if}


