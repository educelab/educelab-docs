# Installation

These docs are built with [MkDocs](https://www.mkdocs.org/) and the
[Material](https://squidfunk.github.io/mkdocs-material/) theme. To preview them
on your own computer, install both into a Python virtual environment (venv).

You need Python 3.8 or newer. To check, run `python3 --version`.

## Set up the venv

1. Clone the repository and go into it:

    ```bash
    git clone https://github.com/educelab/educelab-docs.git
    cd educelab-docs
    ```

2. Create the venv. This makes a `venv/` folder in the repository, which git
   ignores.

    ```bash
    python3 -m venv venv
    ```

3. Activate the venv:

        ```bash
        source venv/bin/activate
        ```

    Your prompt now starts with `(venv)`. Activate the venv again each time you
    open a new terminal.

4. Install MkDocs and the Material theme. `requirements.txt` pins the versions
   CI uses, so your preview matches the published site.

    ```bash
    pip install -r requirements.txt
    ```

## Preview the site

With the venv active, run:

```bash
python -m mkdocs serve
```

Open <http://127.0.0.1:8000/educelab-docs/> in your browser. The page reloads
when you save a file under `docs/` or `mkdocs.yml`. Press Ctrl+C to stop the
server.

!!! tip
    Use `python -m mkdocs` rather than plain `mkdocs`. It always runs the copy
    in the active venv, not a global install that might be missing the Material
    theme.

Before you open a pull request, run a strict build. It fails on broken links,
the same way CI does:

```bash
python -m mkdocs build --strict
```

When you're done, run `deactivate` to leave the venv.
