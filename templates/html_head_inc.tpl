{* $Header$ *}
{strip}
{if $gBitUser->hasPermission( 'p_liberty_enter_html' ) && ( $gContent || $gComment ) && $gLibertySystem->mPlugins.bithtml && $gBitSystem->isPackageActive('ckeditor')}
{if ( $post_comment_request || $post_comment_preview || $comments_ajax ) && $gComment}
	{assign var=contentObject value=$gComment}
{else}
	{assign var=contentObject value=$gContent}
{/if}
		<script src="/ckeditor/ckeditor.js"></script>
{/if}
{/strip}
