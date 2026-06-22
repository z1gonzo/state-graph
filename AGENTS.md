# Instrukcja pracy dla agentów AI

## Rola agenta

Agent pomaga rozwijać projekt zgodnie z aktualnym stanem zapisanym w repozytorium.

Najważniejsze pliki kontekstowe:

- `project_state.md` — aktualna prawda o stanie projektu
- `plan.md` — plan pracy i priorytety
- `README.md` — opis projektu i instrukcje uruchomienia
- `docs/architecture.md` — architektura i moduły
- `docs/decisions.md` — decyzje techniczne

## Zasady główne

1. Nie zakładaj stanu projektu z pamięci rozmowy.
2. Przed większą zmianą sprawdź `project_state.md` i `plan.md`.
3. Zadania wykonuj małymi, testowalnymi krokami.
4. Nie dodawaj nowych technologii bez uzasadnienia i wpisu w `docs/decisions.md`.
5. Nie refaktoruj całego projektu, jeśli zadanie dotyczy małej zmiany.
6. Po zmianach podaj: zmienione pliki, testy, ryzyka, propozycję aktualizacji `project_state.md`.
7. Jeśli kod nie buduje się lub testy nie przechodzą, nie ukrywaj tego — wpisz blocker.

## Tryb pracy Hermes ↔ VSCode/Cline/Codex

1. Hermes planuje i aktualizuje `plan.md`.
2. VSCode/Cline/Codex implementuje konkretne zadanie.
3. Po pracy Hermes robi review, aktualizuje `project_state.md` i proponuje następny krok.

## Format podsumowania po sesji kodowania

```md
## Co zrobiono
- ...

## Pliki zmienione
- ...

## Jak testowano
- ...

## Problemy / blockery
- ...

## Proponowany update `project_state.md`
- ...
```


## Specyfika state-graph

- To osobne repozytorium danych/grafu dla publicznych instytucji i relacji.
- Nie mieszaj go z portalem `ktozkim.pl`; integracja powinna odbywać się przez jawny kontrakt API/eksport/import.
- Priorytet kolejny: Phase 3 — Python data collector / real city data integration.
