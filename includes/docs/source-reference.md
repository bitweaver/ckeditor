# CKEditor source reference

> Generated from the current checkout and then intended for human review.
> Paths are relative to the package root.

## Inventory summary

| Artifact | Count |
|---|---:|
| PHP files | 7 |
| Smarty templates | 3 |
| JavaScript files | 214 |
| CSS files | 17 |

## Bootstrap and schema artifacts

- `admin/schema_inc.php`
- `includes/bit_setup_inc.php`

## First-party classes and interfaces

No first-party PHP class declaration was found.

## Web-facing PHP controllers

- `admin/admin_ckeditor_inc.php`
- `admin/schema_inc.php`
- `ckeditor/samples/assets/posteddata.php`
- `ckeditor/samples/sample_posteddata.php`
- `index.php`
- `smarty/block.ckeditor.php`

## Declared schema tables

No table declaration was mechanically identified. Inspect schema files and runtime SQL before concluding that the package is stateless.

## Plugin and module directories

- `ckeditor/plugins/`
- `ckeditor/samples/plugins/`

## Templates

- `templates/admin_ckeditor.tpl`
- `templates/footer_inc.tpl`
- `templates/menu_ckeditor_admin.tpl`

## Reading cautions

- Presence in this inventory does not make a file a supported public API.
- Bundled third-party libraries must be distinguished from package-owned code.
- Base schema files do not prove the migration state of a deployed database.
- Controllers may rely on include files, globals, services, and template callbacks not visible from their filename alone.
