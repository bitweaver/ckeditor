# CKEditor package documentation

> Engineering documentation derived from the source in this package. The
> package's `includes/` directory must be denied to direct HTTP requests.

## Purpose

CKEditor integrates the browser editor with Bitweaver content-editing forms.

## Responsibility

Owns editor bootstrap, configuration, toolbar integration, and Liberty format/editor hooks.

## Dependencies

kernel, liberty, themes.

Dependency direction matters: this package may depend on the packages above;
the dependencies do not thereby depend on this package.

## Boundary

Does not own content persistence, filtering policy, or application-specific editing workflows.

## Documentation map

- [Architecture](architecture.md) — initialization, components, and request flow.
- [Source reference](source-reference.md) — source-derived files, classes,
  controllers, schema artifacts, plugins, and templates.
- [Development guide](development.md) — safe change workflow, extension points,
  validation, and maintenance guidance.
- [Security](security.md) — trust boundaries and direct-HTTP access requirements.
- [Editor integration](editor-integration.md) — permission-gated loading,
  asset selection, textarea binding, formats, filtering, and upgrade guidance.
