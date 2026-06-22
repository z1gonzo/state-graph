# Decyzje techniczne state-graph

## 2026-06-22 — Osobne repo od ktozkim.pl

Status: accepted

### Kontekst

`state-graph` dostarcza dane/graf, a `ktozkim.pl` jest portalem aplikacyjnym.

### Decyzja

Repo pozostaje osobne i mieszka w:

```text
`<local-workspace>/state-graph`
```

### Konsekwencje

- Integracja z `ktozkim.pl` musi mieć jawny kontrakt.
- Nie mieszamy scraperów/ETL bezpośrednio w portalu.
