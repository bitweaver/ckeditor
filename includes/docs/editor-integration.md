# CKEditor integration

## Scope

This package integrates CKEditor with Bitweaver. The editor distribution can
come from `config/externals/ckeditor/` or the package fallback. Content
persistence, authorization, parsing, and HTML purification remain Liberty
responsibilities.

## Loading

`loadCkEditor()` checks:

1. The `ckeditor` package is active.
2. The current user has `p_liberty_enter_html`.
3. Which editor distribution exists.
4. Themes asset loading for `ckeditor.js` and the jQuery adapter.

The permission check is important: a rich editor must not imply permission to
submit HTML. Server-side verification must enforce the same capability.

## Textarea binding

Templates/JavaScript attach CKEditor to selected editing fields. Initialization
must occur after the editor asset and target textarea exist. Multiple editors,
AJAX-inserted forms, and teardown/reinitialization require explicit testing.

Do not bind every textarea globally; administrative secrets, plain-text fields,
or structured values may be corrupted by HTML editing.

## Format contract

The editor produces HTML-oriented content, but the saved Liberty `format_guid`
determines verification/parsing. Keep editor selection, format selection, and
permission checks consistent. Switching an existing non-HTML document into the
editor can alter source semantics.

## Security boundary

CKEditor is not an HTML sanitizer. Browser configuration and toolbar
restrictions improve authoring UX but are attacker-controlled client state.
Server-side Liberty verification/purification must remove disallowed markup,
URLs, events, and embedded content.

Uploads/file browsing, if enabled by integration, require separate
authorization and path/MIME validation.

## Asset source and upgrades

The external override takes precedence over the bundled fallback. Record and
test the actual deployed version; package code alone may not reveal it.

For an upgrade:

- Review upstream security advisories and browser support.
- Compare configuration/toolbar/plugin changes.
- Check adapter compatibility.
- Test saved HTML through active Liberty filters.
- Test CSP and asset URLs.
- Test both external override and fallback behavior or remove ambiguity.
- Do not edit minified/vendor files for site configuration.

## Configuration

Package preferences should control intentional editor behavior. Keep deployment
paths out of stored editor configuration. JSON/JavaScript configuration must be
encoded rather than assembled with unescaped user values.

## Testing

- Authorized and unauthorized HTML authors.
- Editor active/inactive and package active/inactive.
- External distribution present/absent.
- Multiple and AJAX-created editors.
- Paste from office/web sources.
- Links, images, tables, Unicode, and large documents.
- Disallowed script/event/style/URL input after server save.
- Round trip without unintended source changes.
