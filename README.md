# pagination-in-3-way

The same paginated list implemented three different ways.

## Highlights

- **`flutter_pagewise`** — a page-centric package that handles the maths for you.
- **GetX + Dio** — manual page tracking with reactive state.
- **`pull_to_refresh`** — the familiar pull-to-load-more interaction.
- All three follow the same `model` → `repository` → `controller` → `view` structure, so they are directly comparable.

## Tech Stack

| Concern | Choice |
|---|---|
| UI | Flutter, Material |
| Pagination | `flutter_pagewise`, `pull_to_refresh` |
| State management | `get` |
| Networking | `dio`, `http` |

## Project Structure

```
lib/
- `controller`
- `model`
- `repository`
- `view`
```

## Getting Started

### Prerequisites

- Flutter `>= 3.16` (Dart `>= 3.2`)

### Run

```bash
git clone https://github.com/developer-rahim/pagination-in-3-way.git
cd pagination-in-3-way
flutter pub get
flutter run
```

### Test

```bash
flutter test
flutter analyze
```

## Notes

A useful reference when choosing a pagination approach — each implementation lives in its own branch or folder.

## License

Released under the MIT License.
