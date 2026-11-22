# Changelog

## 0.3.1 - 2026-11-22

- Report a plain "the server did not answer as MySQL" error when the port runs something else, instead of a packet sequence mismatch.

## 0.3.0 - 2026-11-21

- Ported to Raven 3 syntax; requires Raven 3.0.1 or newer.

## 0.2.0 - 2026-07-15

- Guarantee complete socket writes for commands and authentication packets.
- Validate packet sequencing across complete request and response exchanges.
- Reject oversized logical packets before unbounded allocation.
- Reject `LOCAL INFILE` safely while preserving connection reuse.
- Add parameter binding APIs for servers using `NO_BACKSLASH_ESCAPES`.
- Validate malformed authentication-switch packets.
- Expand protocol and Docker end-to-end coverage.
- Test with Raven 2.26.1 in CI.

## 0.1.0 - 2026-06-29

- Initial release.
