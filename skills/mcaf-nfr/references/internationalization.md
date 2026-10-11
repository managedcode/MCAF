# Internationalization and Localization

Use the required locales, scripts, calendars, currencies, and time semantics of the product.

## Design and Verification

- Externalize user-facing text using the existing resource system.
- Verify Unicode, locale-aware formatting/sorting, and required bidirectional layout.
- Inspect rendered text expansion, labels, errors, and accessibility in relevant locales.
- Keep numeric/currency values typed with explicit precision and currency; do not silently convert to an arbitrary base currency.
- Distinguish absolute instants from local dates and wall-clock schedules. Store instants consistently and preserve timezone/calendar intent where local scheduling needs it.
- Exercise daylight-saving transitions, locale parsing, and boundary formatting when the changed flow depends on them.

Link locale-specific behavior to acceptance criteria and meaningful UI/system tests. Changes to persisted time, currency, or serialization contracts require approval.
