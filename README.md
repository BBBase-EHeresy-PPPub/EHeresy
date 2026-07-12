# Epic Heresy

## Requirements

```sh
pip install mkdocs-material mike
```

## Running both games

```bat
start_both.bat
```

Local URLs:

```text
http://127.0.0.1:8000/        - Legions Imperialis 2023 default
http://127.0.0.1:8000/li2023/ - Legions Imperialis 2023
http://127.0.0.1:8000/at2018/ - Adeptus Titanicus 2018
```

## Running one game

```sh
mkdocs serve --config-file mkdocs-li2023.yml
mkdocs serve --config-file mkdocs-at2018.yml
```

## Publishing

Push to `main` or `master`. GitHub Actions builds `li2023` and `at2018` with Mike, sets `li2023` as the default, and publishes the combined site to `gh-pages`.
